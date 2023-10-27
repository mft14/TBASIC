
1 REM Programm zur Umrechnung von UTM-Koordinaten in geographische Koordinaten
2 REM z.B. zur Ermittlung des Standorts aus der Deutschen Generalkarte
3 REM             Christoph Kessler DB1UQ @ DB0GE 19.2.1994
4 REM Ein UTM-Gitternetz ist vor allem in den "Deutschen Generalkarten 1:200000"
5 REM zu finden. Damit spart man den Kauf einer detaillierteren Topographischen
6 REM Karte und das damit verbundene mhsame Peilen mittels Lineal auf die nur
7 REM am Rand angebrachten Koordinaten. Das Gitternetz besteht aus Quadraten
8 REM von 10 km Seitenl„nge, d.h. 5mm entsprechen 1km, damit ist eine
8 REM Absch„tzung auf 100m (=0,5mm) m”glich. Auch eine GPS-Navigations-
10 REM empf„nger ist nicht genauer. Zwei Korrekturfaktoren fr die
11 REM Breitengrade der BRD sind empirisch ermittelt:
12 REM Zun„chst eine lineare Abweichung von 19,73 km
13 REM Die quadratische Abh„ngigkeit vom Abstand zum Mittelmeridian
14 REM korrigiert einen Fehler von ca. 5 km auf den Grenzmeridianen
15 REM Mit diesen beiden Korrekturen ergeben sich Abweichungen
16 REM bei ca. 200 ausgemessenen Kartenpunkten von < 500m
17 REM In dieser Basic-Version ist COS (2*PI)=1 , also nicht in Grad!
18 REM Hier ist PI vordefiniert, sonst einfgen: PI=3.1415926
19 REM bitte beides fr andere Basic-Dialekte nachprfen
20 REM
25 DEFDBL "A-Z": REM  nur fr Atari Omikron.Basic - Double Precision einstellen
30 MM=9: REM  Mittelmeridian fr UTM-Zone 32, ”stlich vom 12.L„ngengrad MM=15
35 GRDPROKM=360/(2* PI *6370): REM         Grad pro km Erdumfang
40 KORR1=19.73: REM                        Korrektur 1
45 KORR2=9.359E-5: REM                     Korrektur 2
50 INPUT "UTM-km zum quator (z.B. 5481.5 )          ";UB
55 INPUT "UTM-km bezgl. Mittelmeridian (z.B. 465.6 )  ";UL
60 UL=UL-500: REM                          Mittelmeridian entspricht "500km"
65 GB=GRDPROKM*(UB+KORR1-(KORR2*UL*UL))
70 GL=MM+(UL*GRDPROKM/ COS(2* PI *GB/360))
75 PRINT "Geographische Breite:                       ";GB;"  Grad"
80 PRINT "Geographische L„nge:                         ";GL;" Grad"
