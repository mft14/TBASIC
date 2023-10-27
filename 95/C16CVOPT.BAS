1 Gosub 300
2 DIM D$(100,J),E$(80),GF$(80),F$(100,J)
3 COLOR 0,11:Z=0:Y=1:KEY OFF:O=0:S=0
4 REM
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
160 PRINT"                               WŽHLEN SIE BITTE"
165 H$=INKEY$:IF H$=""THEN 165
202 IF H$="1" THEN 5000
203 IF H$="2" THEN 10000
204 IF H$="3" THEN END
205 H$=""
210 GOTO 6
300 cls:?:?:?:input"              Was fr ein Array 1-13  ?";j
305 ?:?:INPUT"              Welche Endung   ";Q$
306 ?:?:INPUT"              Soll Original gel”scht werden J/N ";h1$
307 ?:?:INPUT"              Muá RETURN eingefgt werden J/N "h2$
310 return
5000 QF$="DIR *."+Q$+"/W"
5018 REM
5019 SHELL QF$
5020 REM:LOCATE 16,3:PRINT"              Bitte Dateiname, nicht mehr als 8 Zeichen benutzen! "
5030 LOCATE 24,3:INPUT"                   Men mit M !! ";T$
5031 IF T$="M" or T$="m"then end
5041 X$="":D=1
5042 rem
5043 M$=LEFT$(T$,8)
5044 l$=LEFT$(T$,2):print l$
5045 G$=MID$(T$,3,2)
5046 u$=MID$(T$,5,2)
5047 J$=MID$(T$,7,2)
5050 F$=l$+g$+u$+j$+"."+Q$
5065 CLS
5070 OPEN F$ FOR INPUT AS #1
5075 INPUT#1,Z
5080    FOR Y=1 TO Z	
5082    LOCATE 13,10
5084    PRINT TAB(4)"LADE UND KONVERTIERE DATEI    > "T$" <  DATENSATZNUMMER";:PRINT USING "##";Y;
5090       FOR I=1 TO J
5100       LINE INPUT#1,D$(Y,I)
5101       CV=LEN(D$(Y,I))
5102          FOR T=1 TO CV
5103          GF$(T)=(MID$(D$(Y,I),T,1))
5104          F=ASC(GF$(T))
5105          IF F > 64 AND F < 91 THEN F=F+32
5106          IF F=92 THEN F=156
5107          IF H2$="J" OR H2$="j" THEN 5109
5108          GOTO 5130
5109          IF F=10 THEN F=13
5130          IF F=126 THEN F=227
5135          E$=CHR$(F)
5140          F$(Y,I)=F$(Y,I)+E$
5145          NEXT T :
5150          REM
5160       NEXT I:?
5170    NEXT Y
5180 CLOSE#1
5200 IF H1$="J" OR H1$="j" THEN KILL F$
10000 CLS
10010 rem
10016 rem
10017 REM
10124 rem
10022 F$=j$+u$+g$+l$+".DAT"
10023 REM:print F$:
10024 if c$="n"then 30000
10027 X$=""
10045 REM:SHELL SH$
10060 OPEN F$ FOR OUTPUT AS #1
10070 PRINT#1,Z
10080    FOR Y=1 TO Z
10082    LOCATE 13,10
10084    PRINT TAB(8)"SPEICHERE GEŽNDERTE DATEI  > "F$" <  DATENSATZNUMMER ";:PRINT USING "##";Y;
10090       FOR I=1 TO J
10100       PRINT#1,F$(Y,I)
10110       NEXT I
10111    NEXT Y
10112 CLOSE#1
10140 rem
10141 rem
10150 O=0
10160 GOTO 5000
15000 rem
30000 end