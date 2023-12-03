/*
 VGA colour video generation

 Author:   Nick Gammon
 Date:     22nd April 2012
 Version:  1.0

 Version 1.0: initial release

 Connections:

 D3 : Horizontal Sync (68 ohms in series) --> Pin 13 on DB15 socket
 D5 : Red pixel output (470 ohms in series) --> Pin 1 on DB15 socket
 D6 : Green pixel output (470 ohms in series) --> Pin 2 on DB15 socket
 D7 : Blue pixel output (470 ohms in series) --> Pin 3 on DB15 socket
 D10 : Vertical Sync (68 ohms in series) --> Pin 14 on DB15 socket

 Gnd : --> Pins 5, 6, 7, 8, 10 on DB15 socket

 D12 : Switch input --> temporary switch to Gnd (pulled up internally)

 Note: As written, this sketch has 121 bytes of free SRAM memory.

 PERMISSION TO DISTRIBUTE

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software
 and associated documentation files (the "Software"), to deal in the Software without restriction,
 including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
 and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
 subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.


 LIMITATION OF LIABILITY

 The software is provided "as is", without warranty of any kind, express or implied,
 including but not limited to the warranties of merchantability, fitness for a particular
 purpose and noninfringement. In no event shall the authors or copyright holders be liable
 for any claim, damages or other liability, whether in an action of contract,
 tort or otherwise, arising from, out of or in connection with the software
 or the use or other dealings in the software.

*/

#include <string.h> /* for memcpy */
#include "TimerHelpers.h"
#include <avr/pgmspace.h>
#include <avr/sleep.h>
#include "screenFontST.h"

const byte hSyncPin = 3; // <------- HSYNC

const byte redPin   = 5; // <------- Red pixel data
const byte greenPin = 6; // <------- Green pixel data
const byte bluePin  = 7; // <------- Blue pixel data

const byte vSyncPin = 10; // <------- VSYNC

const byte switchPin = 12; // <------- Switch input

/* Length of displayed mode name without null-terminator */
#define STRING_LEN 5u
/* Sync signals polarities are fixed across all modes
 * (negative by default) */
/* Uncomment for positive vertical sync polarity */
// #define VERTICAL_POLARITY_IS_POSITIVE
/* Uncomment for positive horizontal sync polarity */
// #define HORIZONTAL_POLARITY_IS_POSITIVE

typedef struct
{
  uint16_t verticalFrontPorchLineStart; /* precalc */
  uint16_t verticalLines;
  uint16_t frameCountToSwitch;
  char     modeName[ STRING_LEN + 1 ];
  byte     horizontalPeriod; /* in 0.5us steps less one */
  byte     horizontalPulse;  /* in 0.5us steps less one */
  byte     horizontalBackPorchCy;
  byte     horizontalBytes; /* ~375ns per byte */
  byte     verticalPulseLines;
  byte     verticalBackPorchLines; /* including pulse lines less one */
  byte     verticalPixelsPerLine;
  byte     verticalBytes;
} modeParams_st;

static const modeParams_st modeVGA60Hz = {
  /* verticalFrontPorchLineStart (active area + backporch)  */ 480u + 35u,
  /* verticalLines (total including sync pulse and porches) */ 520u,
  /* frameCountToSwitch                                     */ 600u,
  /* modeName                                               */ "VGA60",
  /* horizontalPeriod (in 0.5us steps less one)             */ 63u,
  /* horizontalPulse (in 0.5us steps less one)              */ 5u,
  /* horizontalBackPorchCy                                  */ 3u,
  /* horizontalBytes                                        */ 56u,
  /* verticalPulseLines                                     */ 2u,
  /* verticalBackPorchLines                                 */ 35u - 1u,
  /* verticalPixelsPerLine                                  */ 16u,
  /* verticalBytes (=verticalPixels/verticalPixelsPerLine)  */ 480u / 16u,
};

static const modeParams_st modeSTHigh71Hz = {
  /* verticalFrontPorchLineStart (active area + backporch)  */ 400u + 37u,
  /* verticalLines (total including sync pulse and porches) */ 501u,
  /* frameCountToSwitch                                     */ 710u,
  /* modeName                                               */ "\x0E\x0FH71",
  /* horizontalPeriod (in 0.5us steps less one)             */ 55u,
  /* horizontalPulse (in 0.5us steps less one)              */ 5u,
  /* horizontalBackPorchCy                                  */ 2u,
  /* horizontalBytes                                        */ 48u,
  /* verticalPulseLines                                     */ 1u,
  /* verticalBackPorchLines                                 */ 37u - 1u,
  /* verticalPixelsPerLine                                  */ 16u,
  /* verticalBytes (=verticalPixels/verticalPixelsPerLine)  */ 400u / 16u,
};

static const modeParams_st modeSTLow60Hz = {
  /* verticalFrontPorchLineStart (active area + backporch)  */ 200u + 37u,
  /* verticalLines (total including sync pulse and porches) */ 263u,
  /* frameCountToSwitch                                     */ 600u,
  /* modeName                                               */ "\x0E\x0FL60",
  /* horizontalPeriod (in 0.5us steps less one)             */ 126u,
  /* horizontalPulse (in 0.5us steps less one)              */ 9u,
  /* horizontalBackPorchCy                                  */ 33u,
  /* horizontalBytes                                        */ 90u,
  /* verticalPulseLines                                     */ 3u,
  /* verticalBackPorchLines                                 */ 37u - 1u,
  /* verticalPixelsPerLine                                  */ 10u,
  /* verticalBytes (=verticalPixels/verticalPixelsPerLine)  */ 200u / 10u,
};

static const modeParams_st modeSTLow50Hz = {
  /* verticalFrontPorchLineStart (active area + backporch)  */ 200u + 66u,
  /* verticalLines (total including sync pulse and porches) */ 313u,
  /* frameCountToSwitch                                     */ 500u,
  /* modeName                                               */ "\x0E\x0FL50",
  /* horizontalPeriod (in 0.5us steps less one)             */ 127u,
  /* horizontalPulse (in 0.5us steps less one)              */ 9u,
  /* horizontalBackPorchCy                                  */ 34u,
  /* horizontalBytes                                        */ 90u,
  /* verticalPulseLines                                     */ 3u,
  /* verticalBackPorchLines                                 */ 66u - 1u,
  /* verticalPixelsPerLine                                  */ 10u,
  /* verticalBytes (=verticalPixels/verticalPixelsPerLine)  */ 200u / 10u,
};

/* First mode listed is the mode at startup */
static const modeParams_st * modesArray[] = {
  &modeVGA60Hz,
  &modeSTHigh71Hz,
  &modeSTLow60Hz,
  &modeSTLow50Hz,
};
static modeParams_st videomode;
static byte          currentMode = 0u;

// Timer 1 - Vertical sync
// Lower priority than Timer 2

// output    OC1B   pin 16  (D10) <------- VSYNC

//   Period: 16.64 mS (60 Hz)
//      1/60 * 1e6 = 16666.66 uS
//   Pulse for 64 uS  (2 x HSync width of 32 uS)
//    Sync pulse: 2 lines
//    Back porch: 33 lines
//    Active video: 480 lines
//    Front porch: 10 lines
//       Total: 525 lines

// Timer 2 - Horizontal sync
// Higher priority than Timer 1

// output    OC2B   pin 5  (D3)   <------- HSYNC

//   Period: 32 uS (31.25 kHz)
//      (1/60) / 525 * 1e6 = 31.74 uS
//   Pulse for 4 uS (96 times 39.68 nS)
//    Sync pulse: 96 pixels
//    Back porch: 48 pixels
//    Active video: 640 pixels
//    Front porch: 16 pixels
//       Total: 800 pixels

// Pixel time =  ((1/60) / 525 * 1e9) / 800 = 39.68  nS
//  frequency =  1 / (((1/60) / 525 * 1e6) / 800) = 25.2 MHz

// However in practice, it we can only pump out pixels at 375 nS each because it
//  takes 6 clock cycles to read one in from RAM and send it out the port.

#define nop asm volatile( "nop\n\t" )

// bitmap - gets sent to PORTD
// For D5/D6/D7 bits need to be shifted left 5 bits
//  ie. BGR00000
#define FRAMEBUFFER_SIZE ( 90u * 20u )
static byte frameBuffer[ FRAMEBUFFER_SIZE ];
#define PIXEL_WHITE      ( 0xE0u )
#define PIXEL_BLACK      ( 0x00u )
#define PIXEL_FIRSTVALUE ( 0x20u )

#ifdef HORIZONTAL_POLARITY_IS_POSITIVE
  #define HORIZONTAL_POLARITY CLEAR_B_ON_COMPARE
#else /* horizontal sync polarity is negative */
  #define HORIZONTAL_POLARITY SET_B_ON_COMPARE
#endif

#ifdef VERTICAL_POLARITY_IS_POSITIVE
  #define VSYNC_ACTIVE_LEVEL     HIGH
  #define VSYNC_DEASSERTED_LEVEL LOW
#else /* vertical sync polarity is negative */
  #define VSYNC_ACTIVE_LEVEL     LOW
  #define VSYNC_DEASSERTED_LEVEL HIGH
#endif
static inline void doOneScanLine( void ) __attribute__( ( always_inline ) );

// ISR: Hsync pulse ... this interrupt merely wakes us up
ISR( TIMER2_OVF_vect )
{
} // end of TIMER2_OVF_vect

void setup( void )
{
  byte * FBPtr;
  byte   x, y, i, bitmap;

  memcpy( &videomode, modesArray[ currentMode ], sizeof( modeParams_st ) );

  //assert((videomode.verticalBytes*videomode.horizontalBytes)<=FRAMEBUFFER_SIZE);
  for ( y = 0u; y < videomode.verticalBytes; y++ )
  {
    FBPtr = &frameBuffer[ y * videomode.horizontalBytes ];
    for ( x = 0u; x < videomode.horizontalBytes; x++ )
    {
      *FBPtr++ = ( ( x + y ) << 5 ) & PIXEL_WHITE;
    }
  }

  /* Make a white background for text */
  for ( y = 0u; y < 10u; y++ )
  {
    FBPtr = &frameBuffer[ y * videomode.horizontalBytes ];
    for ( x = 0u; x < ( ( STRING_LEN * 8u ) + 1u ); x++ )
    {
      *FBPtr++ = PIXEL_WHITE;
    }
  }

  /* Bottom right corner pixels are white */
  FBPtr    = &frameBuffer[ ( ( videomode.verticalBytes - 2u )
                          * videomode.horizontalBytes )
                        - 1u ];
  *FBPtr   = PIXEL_WHITE;
  FBPtr    = FBPtr + videomode.horizontalBytes;
  *FBPtr   = PIXEL_WHITE;
  FBPtr    = FBPtr + videomode.horizontalBytes;
  *FBPtr-- = PIXEL_WHITE;
  *FBPtr-- = PIXEL_WHITE;
  *FBPtr   = PIXEL_WHITE;

  /* Draw mode name using font */
  for ( y = 1u; y < 9u; y++ )
  {
    FBPtr = &frameBuffer[ y * videomode.horizontalBytes ];
    for ( x = 0u; x < STRING_LEN; x++ )
    {
      bitmap = pgm_read_byte( screen_font[ y - 1u ] + videomode.modeName[ x ] );
      for ( i = 0u; i < 8u; i++ )
      {
        if ( ( bitmap & 0x80u ) == 0u )
        {
          *FBPtr = PIXEL_BLACK;
        }
        *FBPtr++;
        bitmap = bitmap << 1;
      }
    }
  }

  // disable Timer 0 and Timer 1
  TIMSK0 = 0u; // no interrupts on Timer 0
  OCR0A  = 0u; // and turn it off
  OCR0B  = 0u;
  TIMSK1 = 0u; // no interrupts on Timer 1
  OCR1A  = 0u; // and turn it off
  OCR1B  = 0u;

  OCR2A = 0u;
  OCR2B = 0u;
  TCNT2 = 0u;

  // pin for outputting vertical sync pulses
  digitalWrite( vSyncPin, VSYNC_DEASSERTED_LEVEL );
  pinMode( vSyncPin, OUTPUT );

  // Timer 2 - horizontal sync pulses and line interrupt
  pinMode( hSyncPin, OUTPUT );
  Timer2::setMode( 7, Timer2::PRESCALE_8, Timer2::HORIZONTAL_POLARITY );
  OCR2A  = videomode.horizontalPeriod;
  OCR2B  = videomode.horizontalPulse;
  TIFR2  = bit( TOV2 );  // clear overflow flag
  TIMSK2 = bit( TOIE2 ); // interrupt on overflow on timer 2

  // prepare to sleep between horizontal sync pulses
  set_sleep_mode( SLEEP_MODE_IDLE );

  // pins for outputting the colour information
  PORTD = PIXEL_BLACK;
  pinMode( redPin, OUTPUT );
  pinMode( greenPin, OUTPUT );
  pinMode( bluePin, OUTPUT );

  pinMode( switchPin, INPUT_PULLUP );
  pinMode( LED_BUILTIN, OUTPUT );
  digitalWrite( LED_BUILTIN, LOW );
} // end of setup

// draw a single scan line: has to fit within 28µs (worst case)
static inline void doOneScanLine( void )
{
  static byte *   preloadFB         = frameBuffer;
  static uint16_t vLine             = 0xFFFFu;
  static byte     predivMessageLine = 10u;
  static uint16_t frameCount        = 0u;
  static bool     drawLine          = false;
  byte *          postloadFB;
  byte            j = videomode.horizontalBackPorchCy;

  if ( drawLine )
  {
    while ( j > 0u )
    {
      nop;
      j--;
    }

    // pre-load pointer for speed
    register byte * FBPtr = preloadFB;

    // how many pixels to send
    register byte i = videomode.horizontalBytes;

    // blit pixel data to screen
    while ( i-- )
    {
      PORTD = *FBPtr++;
    }
    // stretch final pixel: nop; nop; nop;

    PORTD      = PIXEL_BLACK; // back to black
    postloadFB = FBPtr;
    predivMessageLine--;
    // every specified pixels it is time to move to a new line in our buffer
    if ( predivMessageLine == 0u )
    {
      predivMessageLine = videomode.verticalPixelsPerLine;
      preloadFB         = postloadFB;
    }
  }
  else if ( vLine >= videomode.verticalLines )
  {
    /* new frame */
    digitalWrite( vSyncPin, VSYNC_ACTIVE_LEVEL );
    vLine             = 0u;
    predivMessageLine = videomode.verticalPixelsPerLine;
    preloadFB         = frameBuffer;
    frameCount++;
    if ( frameCount >= videomode.frameCountToSwitch )
    {
      frameCount = 0u;
      if ( digitalRead( switchPin ) == HIGH )
      {
        frameBuffer[ videomode.horizontalBytes - 1u ] =
            ( frameBuffer[ videomode.horizontalBytes - 1u ] + PIXEL_FIRSTVALUE )
            & PIXEL_WHITE;
      }
      else
      {
        currentMode++;
        if ( currentMode >= ( sizeof( modesArray ) / sizeof( const modeParams_st * ) ) )
        {
          currentMode = 0u;
        }
        setup();
      }
    }
  }
  else if ( vLine == videomode.verticalPulseLines )
  {
    /* after vsync we do the back porch */
    digitalWrite( vSyncPin, VSYNC_DEASSERTED_LEVEL );
  }
  else if ( vLine == videomode.verticalBackPorchLines )
  {
    /* we'll start drawing next line */
    drawLine = true;
  }
  else
  {
    /* do nothing while waiting for end of vsync pulse or porches */
  }
  // finished this line
  vLine++;

  if ( vLine == videomode.verticalFrontPorchLineStart )
  {
    drawLine = false;
  }
} // end of doOneScanLine

void loop( void )
{
  // loop to avoid overhead of function call
  while ( true )
  {
    // sleep to ensure we start up in a predictable way
    sleep_mode();
    doOneScanLine();
  } // end of while
} // end of loop
