EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "lun. 30 mars 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 8650 1450 1    60   ~ 0
Vin
Text Label 9050 1450 1    60   ~ 0
IOREF
Text Label 8600 2500 0    60   ~ 0
A0
Text Label 8600 2600 0    60   ~ 0
A1
Text Label 8600 2700 0    60   ~ 0
A2
Text Label 8600 2800 0    60   ~ 0
A3
Text Label 10250 3000 0    60   ~ 0
0(Rx)
Text Label 10250 2800 0    60   ~ 0
2
Text Label 10250 2900 0    60   ~ 0
1(Tx)
Text Label 10250 2700 0    60   ~ 0
3(**)
Text Label 10250 2600 0    60   ~ 0
4
Text Label 10250 2500 0    60   ~ 0
5(**)
Text Label 10250 2400 0    60   ~ 0
6(**)
Text Label 10250 2300 0    60   ~ 0
7
Text Label 10250 2100 0    60   ~ 0
8
Text Label 10250 2000 0    60   ~ 0
9(**)
Text Label 10250 1900 0    60   ~ 0
10(**/SS)
Text Label 10250 1800 0    60   ~ 0
11(**/MOSI)
Text Label 10250 1700 0    60   ~ 0
12(MISO)
Text Label 10250 1600 0    60   ~ 0
13(SCK)
Text Label 10250 1400 0    60   ~ 0
AREF
NoConn ~ 9100 1600
Text Notes 10550 1000 0    60   ~ 0
Holes
Text Notes 8250 750  0    60   ~ 0
Shield for Arduino that uses\nthe same pin disposition\nlike "Uno" board Rev 3.
$Comp
L Connector_Generic:Conn_01x08 P1
U 1 1 56D70129
P 9300 1900
F 0 "P1" H 9300 2350 50  0000 C CNN
F 1 "Power" V 9400 1900 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 9450 1900 20  0000 C CNN
F 3 "" H 9300 1900 50  0000 C CNN
	1    9300 1900
	1    0    0    -1  
$EndComp
Text Label 8350 1800 0    60   ~ 0
Reset
$Comp
L power:+3.3V #PWR01
U 1 1 56D70538
P 8850 1450
F 0 "#PWR01" H 8850 1300 50  0001 C CNN
F 1 "+3.3V" V 8850 1700 50  0000 C CNN
F 2 "" H 8850 1450 50  0000 C CNN
F 3 "" H 8850 1450 50  0000 C CNN
	1    8850 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 56D707BB
P 8750 1350
F 0 "#PWR02" H 8750 1200 50  0001 C CNN
F 1 "+5V" V 8750 1550 50  0000 C CNN
F 2 "" H 8750 1350 50  0000 C CNN
F 3 "" H 8750 1350 50  0000 C CNN
	1    8750 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 56D70CC2
P 9000 3150
F 0 "#PWR03" H 9000 2900 50  0001 C CNN
F 1 "GND" H 9000 3000 50  0000 C CNN
F 2 "" H 9000 3150 50  0000 C CNN
F 3 "" H 9000 3150 50  0000 C CNN
	1    9000 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 56D70CFF
P 10000 3150
F 0 "#PWR04" H 10000 2900 50  0001 C CNN
F 1 "GND" H 10000 3000 50  0000 C CNN
F 2 "" H 10000 3150 50  0000 C CNN
F 3 "" H 10000 3150 50  0000 C CNN
	1    10000 3150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 P2
U 1 1 56D70DD8
P 9300 2700
F 0 "P2" H 9300 2300 50  0000 C CNN
F 1 "Analog" V 9400 2700 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x06" V 9450 2750 20  0000 C CNN
F 3 "" H 9300 2700 50  0000 C CNN
	1    9300 2700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P5
U 1 1 56D71177
P 10500 650
F 0 "P5" V 10600 650 50  0000 C CNN
F 1 "CONN_01X01" V 10600 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 10421 724 20  0000 C CNN
F 3 "" H 10500 650 50  0000 C CNN
	1    10500 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P6
U 1 1 56D71274
P 10600 650
F 0 "P6" V 10700 650 50  0000 C CNN
F 1 "CONN_01X01" V 10700 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 10600 650 20  0001 C CNN
F 3 "" H 10600 650 50  0000 C CNN
	1    10600 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P7
U 1 1 56D712A8
P 10700 650
F 0 "P7" V 10800 650 50  0000 C CNN
F 1 "CONN_01X01" V 10800 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" V 10700 650 20  0001 C CNN
F 3 "" H 10700 650 50  0000 C CNN
	1    10700 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P8
U 1 1 56D712DB
P 10800 650
F 0 "P8" V 10900 650 50  0000 C CNN
F 1 "CONN_01X01" V 10900 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 10724 572 20  0000 C CNN
F 3 "" H 10800 650 50  0000 C CNN
	1    10800 650 
	0    -1   -1   0   
$EndComp
NoConn ~ 10500 850 
NoConn ~ 10600 850 
NoConn ~ 10700 850 
NoConn ~ 10800 850 
$Comp
L Connector_Generic:Conn_01x08 P4
U 1 1 56D7164F
P 9700 2600
F 0 "P4" H 9700 2100 50  0000 C CNN
F 1 "Digital" V 9800 2600 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 9850 2550 20  0000 C CNN
F 3 "" H 9700 2600 50  0000 C CNN
	1    9700 2600
	-1   0    0    -1  
$EndComp
Wire Notes Line
	8225 825  9625 825 
Wire Notes Line
	9625 825  9625 475 
Wire Wire Line
	9050 1450 9050 1700
Wire Wire Line
	9050 1700 9100 1700
Wire Wire Line
	9100 1900 8850 1900
Wire Wire Line
	9100 2000 8750 2000
Wire Wire Line
	9100 2300 8650 2300
Wire Wire Line
	9100 2100 9000 2100
Wire Wire Line
	9100 2200 9000 2200
Connection ~ 9000 2200
Wire Wire Line
	8650 2300 8650 1450
Wire Wire Line
	8750 2000 8750 1350
Wire Wire Line
	8850 1900 8850 1450
Wire Wire Line
	9100 2500 8600 2500
Wire Wire Line
	9100 2600 8600 2600
Wire Wire Line
	9100 2700 8600 2700
Wire Wire Line
	9100 2800 8600 2800
$Comp
L Connector_Generic:Conn_01x10 P3
U 1 1 56D721E0
P 9700 1600
F 0 "P3" H 9700 2150 50  0000 C CNN
F 1 "Digital" V 9800 1600 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x10" V 9850 1600 20  0000 C CNN
F 3 "" H 9700 1600 50  0000 C CNN
	1    9700 1600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9900 2100 10250 2100
Wire Wire Line
	9900 2000 10250 2000
Wire Wire Line
	9900 1800 10250 1800
Wire Wire Line
	9900 1600 10250 1600
Wire Wire Line
	9900 1400 10250 1400
Wire Wire Line
	9900 3000 10250 3000
Wire Wire Line
	9900 2900 10250 2900
Wire Wire Line
	9900 2800 10250 2800
Wire Wire Line
	9900 2600 10250 2600
Wire Wire Line
	9900 1500 10000 1500
Wire Wire Line
	10000 1500 10000 3150
Wire Wire Line
	9000 2100 9000 2200
Wire Wire Line
	9000 2200 9000 3150
Wire Notes Line
	8200 500  8200 3450
Wire Notes Line
	8200 3450 10900 3450
Wire Wire Line
	9100 1800 8350 1800
Text Notes 9400 1600 0    60   ~ 0
1
Wire Notes Line
	10900 1000 10400 1000
Wire Notes Line
	10400 1000 10400 500 
$Comp
L Connector:DB15_Female_HighDensity_MountingHoles J1
U 1 1 654BE7BD
P 10100 5250
F 0 "J1" H 10100 6117 50  0000 C CNN
F 1 "DB15_Female_HighDensity_MountingHoles" H 10100 6026 50  0000 C CNN
F 2 "Connector_Dsub:DSUB-15-HD_Female_Horizontal_P2.29x1.98mm_EdgePinOffset8.35mm_Housed_MountingHolesOffset10.89mm" H 9150 5650 50  0001 C CNN
F 3 " ~" H 9150 5650 50  0001 C CNN
	1    10100 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 654BF800
P 9550 4850
F 0 "R1" V 9450 4850 50  0000 C CNN
F 1 "470" V 9550 4850 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_0805to1206_RM10_HandSoldering_RevA_Date25Jun2010" V 9480 4850 50  0001 C CNN
F 3 "~" H 9550 4850 50  0001 C CNN
	1    9550 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 654BFA45
P 9550 5050
F 0 "R2" V 9450 5050 50  0000 C CNN
F 1 "470" V 9550 5050 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_0805to1206_RM10_HandSoldering_RevA_Date25Jun2010" V 9480 5050 50  0001 C CNN
F 3 "~" H 9550 5050 50  0001 C CNN
	1    9550 5050
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 654BFC97
P 9550 5250
F 0 "R3" V 9450 5250 50  0000 C CNN
F 1 "470" V 9550 5250 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_0805to1206_RM10_HandSoldering_RevA_Date25Jun2010" V 9480 5250 50  0001 C CNN
F 3 "~" H 9550 5250 50  0001 C CNN
	1    9550 5250
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 654C0319
P 4850 4050
F 0 "R6" V 4950 4100 50  0000 R CNN
F 1 "10k" V 4850 4050 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_0805to1206_RM10_HandSoldering_RevA_Date25Jun2010" V 4780 4050 50  0001 C CNN
F 3 "~" H 4850 4050 50  0001 C CNN
	1    4850 4050
	-1   0    0    1   
$EndComp
$Comp
L Device:R R7
U 1 1 654C0769
P 5500 5100
F 0 "R7" V 5400 5050 50  0000 L CNN
F 1 "10k" V 5500 5100 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_0805to1206_RM10_HandSoldering_RevA_Date25Jun2010" V 5430 5100 50  0001 C CNN
F 3 "~" H 5500 5100 50  0001 C CNN
	1    5500 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 654C0A4A
P 10600 5250
F 0 "R4" V 10500 5250 50  0000 C CNN
F 1 "100" V 10600 5250 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_0805to1206_RM10_HandSoldering_RevA_Date25Jun2010" V 10530 5250 50  0001 C CNN
F 3 "~" H 10600 5250 50  0001 C CNN
	1    10600 5250
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 654C0D74
P 10600 5450
F 0 "R5" V 10500 5450 50  0000 C CNN
F 1 "100" V 10600 5450 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_0805to1206_RM10_HandSoldering_RevA_Date25Jun2010" V 10530 5450 50  0001 C CNN
F 3 "~" H 10600 5450 50  0001 C CNN
	1    10600 5450
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 654C102B
P 5200 4700
F 0 "R8" V 5100 4650 50  0000 L CNN
F 1 "150" V 5200 4700 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_0805to1206_RM10_HandSoldering_RevA_Date25Jun2010" V 5130 4700 50  0001 C CNN
F 3 "~" H 5200 4700 50  0001 C CNN
	1    5200 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 654C1441
P 5850 5750
F 0 "R9" V 5750 5700 50  0000 L CNN
F 1 "150" V 5850 5750 50  0000 C CNN
F 2 "Resistors_Universal:Resistor_SMD+THTuniversal_0805to1206_RM10_HandSoldering_RevA_Date25Jun2010" V 5780 5750 50  0001 C CNN
F 3 "~" H 5850 5750 50  0001 C CNN
	1    5850 5750
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q1
U 1 1 654C1B4A
P 5100 4250
F 0 "Q1" H 5290 4296 50  0000 L CNN
F 1 "2N3904" H 5290 4205 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 5300 4175 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 5100 4250 50  0001 L CNN
	1    5100 4250
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q2
U 1 1 654C214E
P 5750 5300
F 0 "Q2" H 5940 5346 50  0000 L CNN
F 1 "2N3904" H 5940 5255 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 5950 5225 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 5750 5300 50  0001 L CNN
	1    5750 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 654C55A4
P 10100 6050
F 0 "#PWR0101" H 10100 5800 50  0001 C CNN
F 1 "GND" H 10100 5900 50  0000 C CNN
F 2 "" H 10100 6050 50  0000 C CNN
F 3 "" H 10100 6050 50  0000 C CNN
	1    10100 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 5950 10100 6000
Wire Wire Line
	9800 5650 9750 5650
Wire Wire Line
	9750 5650 9750 6000
Wire Wire Line
	9750 6000 10100 6000
Connection ~ 10100 6000
Wire Wire Line
	10100 6000 10100 6050
Wire Wire Line
	9800 5550 9750 5550
Wire Wire Line
	9750 5550 9750 5650
Connection ~ 9750 5650
Wire Wire Line
	9700 4850 9800 4850
Wire Wire Line
	9700 5050 9800 5050
Wire Wire Line
	9700 5250 9800 5250
Wire Wire Line
	9750 5550 9750 5150
Wire Wire Line
	9750 4950 9800 4950
Connection ~ 9750 5550
Wire Wire Line
	9800 5150 9750 5150
Connection ~ 9750 5150
Wire Wire Line
	9750 5150 9750 4950
Wire Wire Line
	9800 4750 9750 4750
Wire Wire Line
	9750 4750 9750 4950
Connection ~ 9750 4950
NoConn ~ 9800 5450
NoConn ~ 9800 5350
NoConn ~ 10400 4850
NoConn ~ 10400 5050
NoConn ~ 10400 5650
Wire Wire Line
	10400 5250 10450 5250
Wire Wire Line
	10400 5450 10450 5450
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 654D938F
P 4400 5000
F 0 "J2" V 4462 5144 50  0000 L CNN
F 1 "Conn_01x03_Male" V 4553 5144 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 4400 5000 50  0001 C CNN
F 3 "~" H 4400 5000 50  0001 C CNN
	1    4400 5000
	0    1    1    0   
$EndComp
Text GLabel 10800 2500 2    50   Input ~ 0
Red
Text GLabel 10800 2400 2    50   Input ~ 0
Green
Text GLabel 10800 2300 2    50   Input ~ 0
Blue
Text GLabel 10800 1900 2    50   Input ~ 0
Vsync
Text GLabel 10800 2700 2    50   Input ~ 0
Hsync
Wire Wire Line
	9900 2500 10800 2500
Wire Wire Line
	9900 2400 10800 2400
Wire Wire Line
	9900 2300 10800 2300
Wire Wire Line
	9900 1900 10800 1900
Wire Wire Line
	9900 2700 10800 2700
Text GLabel 9350 4850 0    50   Input ~ 0
Red
Text GLabel 9350 5050 0    50   Input ~ 0
Green
Text GLabel 9350 5250 0    50   Input ~ 0
Blue
Wire Wire Line
	9350 5250 9400 5250
Wire Wire Line
	9350 5050 9400 5050
Wire Wire Line
	9350 4850 9400 4850
$Comp
L Diode:1N914 D1
U 1 1 65506546
P 4550 4250
F 0 "D1" H 4550 4467 50  0000 C CNN
F 1 "1N914" H 4550 4376 50  0000 C CNN
F 2 "Diodes_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4550 4075 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85622/1n914.pdf" H 4550 4250 50  0001 C CNN
	1    4550 4250
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N914 D2
U 1 1 655072E1
P 4050 5350
F 0 "D2" H 4050 5567 50  0000 C CNN
F 1 "1N914" H 4050 5476 50  0000 C CNN
F 2 "Diodes_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4050 5175 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85622/1n914.pdf" H 4050 5350 50  0001 C CNN
	1    4050 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 3850 4850 3850
Wire Wire Line
	4850 3850 4850 3900
Wire Wire Line
	4850 4200 4850 4250
Wire Wire Line
	4850 4250 4900 4250
Wire Wire Line
	5200 4450 5200 4500
Wire Wire Line
	4700 4250 4850 4250
Connection ~ 4850 4250
$Comp
L power:+5V #PWR0102
U 1 1 6550F652
P 5200 3750
F 0 "#PWR0102" H 5200 3600 50  0001 C CNN
F 1 "+5V" V 5200 3950 50  0000 C CNN
F 2 "" H 5200 3750 50  0000 C CNN
F 3 "" H 5200 3750 50  0000 C CNN
	1    5200 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 4050 5200 3850
Wire Wire Line
	5200 3750 5200 3850
Connection ~ 5200 3850
$Comp
L power:GND #PWR0103
U 1 1 65514C49
P 5200 4900
F 0 "#PWR0103" H 5200 4650 50  0001 C CNN
F 1 "GND" H 5200 4750 50  0000 C CNN
F 2 "" H 5200 4900 50  0000 C CNN
F 3 "" H 5200 4900 50  0000 C CNN
	1    5200 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 4850 5200 4900
Wire Wire Line
	4500 5200 4500 5250
Wire Wire Line
	4500 5250 4850 5250
Wire Wire Line
	4850 5250 4850 4500
Wire Wire Line
	4400 5350 4200 5350
Wire Wire Line
	4400 5200 4400 5350
Text GLabel 4350 4250 0    50   Input ~ 0
Hsync
Text GLabel 3850 5350 0    50   Input ~ 0
Vsync
Wire Wire Line
	5550 5300 5500 5300
Wire Wire Line
	5500 5300 5500 5250
Wire Wire Line
	5500 4950 5500 4900
Wire Wire Line
	5500 4900 5850 4900
Wire Wire Line
	5850 4900 5850 5100
Wire Wire Line
	5500 5300 4300 5300
Wire Wire Line
	4300 5300 4300 5200
Connection ~ 5500 5300
Wire Wire Line
	5850 5500 5850 5550
Wire Wire Line
	5200 3850 5850 3850
Wire Wire Line
	5850 3850 5850 4900
Connection ~ 5850 4900
$Comp
L power:GND #PWR0104
U 1 1 6552B20F
P 5850 5950
F 0 "#PWR0104" H 5850 5700 50  0001 C CNN
F 1 "GND" H 5850 5800 50  0000 C CNN
F 2 "" H 5850 5950 50  0000 C CNN
F 3 "" H 5850 5950 50  0000 C CNN
	1    5850 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 5900 5850 5950
Text Notes 4200 4950 0    50   ~ 0
  Sync\nH+V | Comp
Text GLabel 5350 4500 2    50   Input ~ 0
H
Wire Wire Line
	5350 4500 5200 4500
Connection ~ 5200 4500
Wire Wire Line
	5200 4500 5200 4550
Text GLabel 6000 5550 2    50   Input ~ 0
V
Wire Wire Line
	6000 5550 5850 5550
Connection ~ 5850 5550
Wire Wire Line
	5850 5550 5850 5600
Text GLabel 10800 5250 2    50   Input ~ 0
H
Text GLabel 10800 5450 2    50   Input ~ 0
V
Wire Wire Line
	10800 5450 10750 5450
Wire Wire Line
	10800 5250 10750 5250
Wire Wire Line
	4350 4250 4400 4250
Wire Wire Line
	3850 5350 3900 5350
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J3
U 1 1 65547004
P 5300 2400
F 0 "J3" H 5350 2817 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 5350 2726 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x05_Pitch2.54mm" H 5300 2400 50  0001 C CNN
F 3 "~" H 5300 2400 50  0001 C CNN
	1    5300 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 6554785A
P 5350 2750
F 0 "#PWR0105" H 5350 2500 50  0001 C CNN
F 1 "GND" H 5350 2600 50  0000 C CNN
F 2 "" H 5350 2750 50  0000 C CNN
F 3 "" H 5350 2750 50  0000 C CNN
	1    5350 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2750 5350 2700
Wire Wire Line
	5350 2700 5050 2700
Wire Wire Line
	5050 2700 5050 2600
Wire Wire Line
	5050 2600 5100 2600
Wire Wire Line
	5600 2600 5650 2600
Wire Wire Line
	5650 2600 5650 2700
Wire Wire Line
	5650 2700 5350 2700
Connection ~ 5350 2700
Wire Wire Line
	5100 2200 5050 2200
Wire Wire Line
	5050 2200 5050 2600
Connection ~ 5050 2600
Wire Wire Line
	5600 2200 5650 2200
Wire Wire Line
	5650 2200 5650 2600
Connection ~ 5650 2600
Text GLabel 4950 2500 0    50   Input ~ 0
Red
Text GLabel 4950 2400 0    50   Input ~ 0
Green
Text GLabel 4950 2300 0    50   Input ~ 0
Blue
Wire Wire Line
	4950 2500 5100 2500
Wire Wire Line
	4950 2400 5100 2400
Wire Wire Line
	4950 2300 5100 2300
Text GLabel 5750 2500 2    50   Input ~ 0
Hsync
Text GLabel 5750 2300 2    50   Input ~ 0
Vsync
Wire Wire Line
	5600 2300 5750 2300
Wire Wire Line
	5600 2500 5750 2500
Text GLabel 5750 2400 2    50   Input ~ 0
C
Wire Wire Line
	5750 2400 5600 2400
Text GLabel 10800 1700 2    50   Input ~ 0
Switch
Wire Wire Line
	9900 1700 10800 1700
$Comp
L power:GND #PWR0106
U 1 1 65587076
P 7350 4400
F 0 "#PWR0106" H 7350 4150 50  0001 C CNN
F 1 "GND" H 7350 4250 50  0000 C CNN
F 2 "" H 7350 4400 50  0000 C CNN
F 3 "" H 7350 4400 50  0000 C CNN
	1    7350 4400
	1    0    0    -1  
$EndComp
Text GLabel 7300 3850 0    50   Input ~ 0
Switch
Wire Wire Line
	7300 3850 7350 3850
Wire Wire Line
	7350 3850 7350 3900
NoConn ~ 8350 1800
NoConn ~ 8650 1450
NoConn ~ 8600 2500
NoConn ~ 8600 2600
NoConn ~ 8600 2700
NoConn ~ 8600 2800
NoConn ~ 9050 1450
NoConn ~ 10250 1400
NoConn ~ 10250 1600
NoConn ~ 10250 1800
NoConn ~ 10250 2000
NoConn ~ 10250 2100
NoConn ~ 10250 2600
NoConn ~ 10250 2800
NoConn ~ 10250 2900
NoConn ~ 10250 3000
NoConn ~ 10250 1300
Text Label 10250 1300 0    60   ~ 0
A4(SDA)
Wire Wire Line
	9900 1300 10250 1300
Text Label 10250 1200 0    60   ~ 0
A5(SCL)
NoConn ~ 10250 1200
Wire Wire Line
	9900 1200 10250 1200
NoConn ~ 9100 2900
NoConn ~ 9100 3000
$Comp
L Switch:SW_Push SW1
U 1 1 65644F5F
P 7350 4100
F 0 "SW1" V 7304 4248 50  0000 L CNN
F 1 "SW_Push" V 7395 4248 50  0000 L CNN
F 2 "Buttons_Switches_THT:SW_Tactile_Straight_KSA0Axx1LFTR" H 7350 4300 50  0001 C CNN
F 3 "~" H 7350 4300 50  0001 C CNN
	1    7350 4100
	0    1    1    0   
$EndComp
Wire Wire Line
	7350 4300 7350 4400
Text GLabel 4900 4500 2    50   Input ~ 0
C
Wire Wire Line
	4900 4500 4850 4500
Connection ~ 4850 4500
Wire Wire Line
	4850 4500 4850 4250
$EndSCHEMATC
