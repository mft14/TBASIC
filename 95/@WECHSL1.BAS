1 goto 300
2 DIM D$(Z,NN),E$(80),GF$(80),F$(Z,NN):GOTO 5080
3 Z=0:Y=1:KEY OFF:O=0:S=0
4 GOTO 5080
5 GOTO 5000
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
110?"                                  2 -UMSCHREIBEN"
120?
130?"                                  3 - BEENDEN"
140?
145 IF Z=0 THEN PRINT"                              KEINE DATEI GELADEN ":?:D=0:GOTO 155
150?:?"                                  FILE  "f$" DS "z
155?
160 PRINT"                               W�HLEN SIE BITTE"
165 H$=INKEY$:IF H$=""THEN 165
202 IF H$="1" THEN 15000
203 IF H$="2" THEN 10000
204 IF H$="3" THEN 30000
205 H$=""
210 GOTO 6
300 cls:?:?:?:INPUT"              Welches Array  ";nn
305 REM:?:INPUT"              Wieviel Datens�tze  ";CN
310 ?:INPUT"              Welche Endung  ";qa$
320 ?:INPUT"              Soll RETURN eingef�gt werden  ";qb$
330 ?:INPUT"              Soll der Name getauscht werden  ";qc$
335 ?:INPUT"              Soll die alte Datei gel�scht werden  ";qd$
337 ?:INPUT"              Welche Endung nach Konvertierung  ";qe$
5000 rem
5019 SHELL "DIR *."+qa$+"/W/P"
5030 LOCATE 24,3:INPUT"                   Ende mit E !!       ";T$
5031 IF T$="E" or T$="e" THEN END
5041 X$="":D=1
5044 l$=LEFT$(T$,2)
5045 G$=MID$(T$,3,2)
5046 u$=MID$(T$,5,2)
5047 J$=MID$(T$,7,2)
5050 F$=l$+g$+u$+j$+"."+qa$
5065 CLS
5070 OPEN F$ FOR INPUT AS #1
5075 INPUT#1,Z
5078 GOTO 2
5080    FOR Y=1 TO Z
5082    LOCATE 13,10
5084    PRINT TAB(20)"LADE DATEI    > "F$" <  DATENSATZNUMMER";:PRINT USING  "###";Y;
5090       FOR I=1 TO NN
5100       LINE INPUT#1,D$(Y,I)
5101       CV=LEN(D$(Y,I))
5102          FOR T=1 TO CV
5103          GF$(T)=(MID$(D$(Y,I),T,1))
5104          F=ASC(GF$(T))
5105          IF F=10 AND QB$="J" OR QB$="j" THEN F=13
5106          IF F > 223 AND F < 255 THEN F=F-64
5107          IF F > 191 AND F < 224 THEN F=F-96
5108          IF F=115 THEN F=3
5109          IF F=255 THEN F=227
5110          IF F > 64 AND F < 91 THEN F=F+32
5111          REM:IF F=115 THEN F=3
5112          E$=CHR$(F)
5113          F$(Y,I)=F$(Y,I)+E$
5114          NEXT T :
5115          H2$(I)=H2$(I)+H1$
5116       NEXT I:?
5117    NEXT Y
5120 CLOSE#1
10000 CLS
10124 IF QC$="N" OR QC$="n" THEN 10026
10022 F$=j$+u$+g$+l$+"."+qe$
10023 REM
10024 if c$="n"then 30000
10025 GOTO 10045
10026 F$=L$+G$+U$+J$+"."+QE$
10027 X$=""
10045 REM:SHELL SH$
10060 OPEN F$ FOR OUTPUT AS #1
10070 PRINT#1,Z
10080    FOR Y=1 TO Z
10082    LOCATE 12,10
10084    PRINT TAB(20)"SPEICHERE DATEI  > "T$" <  DATENSATZNUMMER ";:PRINT USING  "###";Y;
10090       FOR I=1 TO NN
10100       PRINT#1,F$(Y,I)
10110       NEXT I
10111    NEXT Y
10112 CLOSE#1
10140 rem
10141 IF QD$="J" OR QD$="j" THEN KILL T$+"."+QA$
10150 O=0
10160 goto 5019
15000 rem
30000 end