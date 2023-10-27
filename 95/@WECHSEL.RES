1 goto 300
2 DIM D$(CZ,NN),E$(80),GF$(80),F$(CZ,NN),H1$(80),H2$(80)
3 Z=0:Y=1:KEY OFF:O=0:S=0
4 GOTO 310
5 REM:GOTO 5000
300 cls:?:?:?:INPUT"              Welches Array  ";nn
305 ?:INPUT"              Wieviel Datens„tze  ";CZ:goto 2
310 ?:INPUT"              Welche Endung  ";qa$
320 ?:INPUT"              Soll RETURN eingefgt werden  ";qb$
330 ?:INPUT"              Soll der Name getauscht werden  ";qc$
335 ?:INPUT"              Soll die alte Datei gel”scht werden  ";qd$
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
5078 REM
5080    FOR Y=1 TO Z
5082    LOCATE 13,10
5084    PRINT TAB(20)"LADE DATEI    > "F$" <  DATENSATZNUMMER";:PRINT USING  "###";Y;
5090       FOR I=1 TO NN
5100       LINE INPUT#1,D$(Y,I)
5101       CV=LEN(D$(Y,I))
5102          FOR T=1 TO CV
5103          GF$(T)=(MID$(D$(Y,I),T,1))
5104          F=ASC(GF$(T))
5105          IF F=115 THEN F=3
5106          IF F=10 AND QB$="J" OR QB$="j" THEN F=13
5107          IF F > 223 AND F < 255 THEN F=F-64
5108          IF F > 191 AND F < 224 THEN F=F-96
5109          IF F=255 THEN F=227
5110          IF F > 64 AND F < 91 THEN F=F+32
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