2 DIM D$(100,8)
3 COLOR 0,11:Z=0:Y=1:KEY OFF:O=0:S=0
4 GOTO 300
5 GOSUB 5000
6 CLS:H$="":X$=""
10 C$=""
11 ?"                    ----------------------------------------"
12 ?"                     PROGRAMM VON JUNI '89 VERSION 3.95  (C)"
13 ?"                    ----------------------------------------"
30 F=0
60 ?:?"                                  DIARIO (C)
70 ?:?
100?"                                  1 - SCHREIBEN"
105?
110?"                                  2 - LESEN"
120?
130?"                                  3 - BEENDEN"
140?
145 IF Z=0 THEN PRINT"                              KEINE DATEI GELADEN":?:D=0:GOTO 155
150?:?"                                  FILE  "MY$+Y$
155?
160 PRINT"                               W�HLEN SIE BITTE"
165 H$=INKEY$:IF H$=""THEN 165
202 IF H$="1" THEN 15000
203 IF H$="2" THEN 25000
204 IF H$="3" THEN 30000
205 H$=""
210 GOTO 6
300 cls:?:?:?:?"              Neue Datei �ffnen   Y/N  ?"
310 X$=INKEY$:IF X$="" THEN 310
320 IF X$="Y" OR X$="y" THEN 15000
330 IF X$="N" OR X$="n" THEN 5
5000 CLS:?:?
5004 ?:?"                     PASSWORT   ? "
5005 E$=INPUT$(3):IF E$=chr$(0)then 5005
5006 IF E$<>"237"THEN CLS:?:?:?:?"                   KEIN ZUGRIFF  !":END
5007 DI$="DIARIO"
5008 DJ$="IF NOT DIREXIST "+DI$+" MD "+DI$
5009 SHELL DJ$
5013 SHELL "CD DIARIO"
5014 SHELL "DIR/W"
5015 LOCATE 23,1:INPUT"               Bitte geben Sie das gew�nschte Verzeichnis an!";u$
5016 GH$=u$
5017 CHDIR GH$
5018 CLS
5019 SHELL "DIR/W"
5020 LOCATE 16,3:PRINT"              Bitte Dateiname, nicht mehr als 8 Zeichen benutzen! "
5021 LOCATE 17,3:PRINT"          Die beiden letzten Zeichen f�r das Jahr. .DAT weglassen !!!"
5030 ?:?:INPUT"                   Men� mit M !! ";T$
5031 IF T$="M" or T$="m" THEN 6
5032 K=LEN(T$)-2
5033 SHELL "CD.."
5034 SHELL "CD.."
5041 CLS:X$="":D=1
5042 Y$=RIGHT$(T$,2)
5043 M$=LEFT$(T$,K)
5050 REM
5065 F$=M$+Y$+".DAT"
5066 CH$="DIARIO\"+y$
5067 CHDIR CH$
5070 OPEN F$ FOR INPUT AS #1
5075 INPUT#1,Z
5080    FOR Y=1 TO Z
5082    LOCATE 13,10
5084    PRINT TAB(20)"LADE DATEI    > "T$" <  DATENSATZNUMMER ";:PRINT USING "##";Y;
5090       FOR I=1 TO 8
5100       LINE INPUT#1,D$(Y,I)
5110       NEXT I
5111    NEXT Y
5120 CLOSE#1
5125 SHELL "CD.."
5130 SHELL "CD.."
5200 RETURN
10000 CLS
10002 IF D=0 THEN T$=""
10005 IF T$=""THEN 10008
10007 GOTO 10022
10008 ?:?:INPUT"               Bitte Dateiname, maximal 8 Zeichen  z.B. xxxxxx95";T$
10009 IF T$=""THEN CLS:GOTO 10010
10010 l=LEN(T$)
10011 K=L-2:
10012 Y$=RIGHT$(T$,2)
10013 M$=LEFT$(T$,K)
10014 REM:GOSUB 55000
10016 D=1
10017 REM
10022 F$=M$+Y$+".DAT"
10027 X$=""
10030 LE$=Y$
10040 PRINT:INPUT"            Soll im Unterverzeichnis Briefe gespeichert werden  Y/N ";br$
10041 IF BR$="N" OR BR$="n" THEN 10124
10045 REM:SHELL SH$
10050 ?:?:?"                            Speichere ge�nderte Datei"
10053 DH$="LETTERS"
10055 HH$="IF NOT DIREXIST "+DH$+" MD "+DH$
10056 SHELL HH$
10059 CHDIR DH$
10060 OPEN F$ FOR OUTPUT AS #1
10070 PRINT#1,Z
10080    FOR Y=1 TO Z
10082    LOCATE 12,10
10084    PRINT TAB(20)"SPEICHERE DATEI  > "T$" <  DATENSATZNUMMER ";:PRINT USING "##";Y;
10090       FOR I=1 TO 8
10100       PRINT#1,D$(Y,I)
10110       NEXT I
10111    NEXT Y
10112 CLOSE#1
10113 SHELL "CD.."
10114 DI$="DIARIO"
10115 DJ$="IF NOT DIREXIST "+DI$+" MD "+DI$
10116 SHELL DJ$
10124 PRINT:PRINT"                         Speichere jetzt Sicherheitskopie "
10125 SHELL "CD DIARIO"
10126 SH$="IF NOT DIREXIST "+Y$+" MD "+Y$
10127 SHELL SH$
10128 CH$=Y$
10129 CHDIR CH$
10130 OPEN F$ FOR OUTPUT AS #1
10131 PRINT#1,Z
10132    FOR Y=1 TO Z
10133    LOCATE 12,10
10134    PRINT TAB(20)"SPEICHERE DATEI  > "T$" <  DATENSATZNUMMER ";:PRINT USING "##";Y;
10135       FOR I=1 TO 8
10136       PRINT#1,D$(Y,I)
10137       NEXT I
10138    NEXT Y
10139 CLOSE#1
10140 rem
10141 rem
10142 SHELL "CD.."
10143 SHELL "CD.."
10150 O=0:X$=""
10160 RETURN
15000 Z=Z+1:Y=Y+1
15010 CLS:?:?"             Dateneingabe             Seite "Z
15020 O=1
15025 REM
15035    FOR I=1 TO 8
15037       ?:? I;
15040       LINE INPUT D$(Z,I)
15045       IF D$(Z,I)=""THEN D$(Z,I)="---"
15050    NEXT I
15060 ?:?:PRINT"                           Eingabe OK  Y/N "
15070 X$=INKEY$:IF X$=""THEN 15070
15080 IF X$<>"Y"AND X$<>"N"AND x$<>"y"AND x$<>"n" THEN 15060
15085 IF X$="N" OR X$="n" THEN BEEP:?:INPUT"             Nein ?  Die Seite ist weg bei N!  Y/N ?";EF$
15086 IF EF$="Y" OR EF$="y" THEN 15095
15090 IF X$="N"or x$="n"THEN Z=Z-1:Y=Y-1:X$="":O=0:GOTO 6
15095 X$=""
15100 ?:PRINT"                           N�chste Seite    Y/N "
15110 X$=INKEY$:IF X$=""THEN 15110
15120 IF X$<>"Y"AND X$<>"N"AND X$<>"y"AND X$<>"n"THEN 15100
15130 IF X$="Y"OR X$="y"THEN X$="":GOTO 15000
15140 GOTO 6
25000 CLS:ZZ=1:X$=""
25007 IF Z=0 THEN 41000
25010 CLS:?:?TAB(3)"Lesen/�ndern          Seite"ZZ"von"Z"           Datei "T$
25020 ?"---------------------------------------------------------------------"
25025 ?:
25040    FOR I=1 TO 8
25050    PRINT I;D$(ZZ,I)
25060    PRINT
25070    NEXT I
25085 ?"---------------------------------------------------------------------"
25090 ?:PRINT"     (V)orw�rts       (Z)ur�ck        (M)en�        (�)ndern"
25094 X$=""
25095 X$=INKEY$:IF X$=""THEN 25095
25100 IF X$="V"AND ZZ<Z THEN ZZ=ZZ+1:GOTO 25010
25102 IF X$="v"AND ZZ<Z THEN ZZ=ZZ+1:GOTO 25010
25105 IF X$="V"AND ZZ=Z THEN ZZ=1:GOTO 25010
25107 IF X$="v"AND ZZ=Z THEN ZZ=1:GOTO 25010
25110 IF X$="Z"AND ZZ>1 THEN ZZ=ZZ-1:GOTO 25010
25112 IF X$="z"AND ZZ>1 THEN ZZ=ZZ-1:GOTO 25010
25115 IF X$="Z"AND ZZ=1 THEN ZZ=Z:GOTO 25010
25117 IF X$="z"AND ZZ=1 THEN ZZ=Z:GOTO 25010
25120 IF X$="M"OR X$="m"THEN 6
25130 IF X$="�"OR X$="�"THEN 25150
25140 GOTO 6
25150 INPUT"   Zeile NR.  ";X
25160 IF X<1 OR X>8 THEN 25150
25165 O=1
25170 LINE INPUT"   Neue Eingabe ";D$(ZZ,X)
25180 IF D$(ZZ,X)=""THEN D$(ZZ,X)="---"
25190 GOTO 25010
30000 CLS:X$=""
30010 IF O=1 THEN GOSUB 10000
30020 PRINT:PRINT:PRINT:INPUT"             M�chten Sie be(E)nden oder (W)eiterarbeiten  E/W ?";EE$
30030 IF EE$="W" OR EE$="w" THEN 5
30040 COLOR 7,0:CLS:PRINT:PRINT:PRINT:PRINT
30050 PRINT"   Achtung, vergessen Sie nicht, mindestens einmal in der Woche das "
30055 PRINT"           Virussuchprogramm SDScan laufen zu lassen ! "
30057 ?:?:?:?:?:?:?:?:?
30060 For T=1 TO 25000:NEXT T:END
41000 CLS:?:?:?"   KEINE DATEN GESPEICHERT !"
41010 FOR T=1 TO 10000:NEXT T
41020 GOTO 6
