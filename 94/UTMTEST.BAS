
1 PRINT" Programm zur Umrechnung von UTM-Koordinaten in geographische Koordinaten"
2 PRINT" z.B. zur Ermittlung des Standorts aus der Deutschen Generalkarte"
3 PRINT"             Christoph Kessler DB1UQ @ DB0GE 19.2.1994"
4 PRINT" Ein UTM-Gitternetz ist vor allem in den Deutschen Generalkarten 1:200000"
5 PRINT" zu finden. Damit spart man den Kauf einer detaillierteren Topographischen"
6 PRINT" Karte und das damit verbundene mÅhsame Peilen mittels Lineal auf die nur"
7 PRINT" am Rand angebrachten Koordinaten. Das Gitternetz besteht aus Quadraten"
8 PRINT" von 10 km SeitenlÑnge, d.h. 5mm entsprechen 1km, damit ist eine"
9 PRINT" AbschÑtzung auf 100m (=0,5mm) mîglich. Auch eine GPS-Navigations-"
10 PRINT" empfÑnger ist nicht genauer. Zwei Korrekturfaktoren fÅr die"
11 PRINT" Breitengrade der BRD sind empirisch ermittelt:"
12 PRINT" ZunÑchst eine lineare Abweichung von 19,73 km"
13 PRINT" Die quadratische AbhÑngigkeit vom Abstand zum Mittelmeridian"
14 PRINT" korrigiert einen Fehler von ca. 5 km auf den Grenzmeridianen"
15 PRINT" Mit diesen beiden Korrekturen ergeben sich Abweichungen"
16 PRINT" bei ca. 200 ausgemessenen Kartenpunkten von < 500m"
27 INPUT"   WEITER MIT RETURN";X$
28 color 1,11:cls
29 PI=3.1415926
30 MM=9: REM  Mittelmeridian fÅr UTM-Zone 32, îstlich vom 12.LÑngengrad MM=15
35 GK=360/(2* PI *6370): REM         Grad pro km Erdumfang
40 KR1=19.73: REM                        Korrektur 1
45 KR2=9.359E-5: REM                     Korrektur 2
50 INPUT "UTM-km zum équator (z.B. 5481.5 )          ";UB
55 INPUT "UTM-km bezgl. Mittelmeridian (z.B. 465.6 )  ";UL
60 UL=UL-500: REM                          Mittelmeridian entspricht "500km"
65 GB=GK*(UB+KR1-(KR2*UL*UL))
70 GL=MM+(UL*GK/ COS(2* PI *GB/360))
75 PRINT "Geographische Breite:                       ";GB;"  Grad"
80 PRINT "Geographische LÑnge:                         ";GL;" Grad"
