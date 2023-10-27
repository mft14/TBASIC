2 DIM D$(100,8)
3 Z=0:Y=1:KEY OFF:O=0:S=0
4 GOTO 300
5 GOSUB 5000
6 CLS:H$="":X$=""
10 C$=""
11 ?" " chr$(201);:for I=1 TO 76:?CHR$(205);:NEXT:?CHR$(187);
12 ?" ";:?" " chr$(186)"                  PROGRAMM VON JUNI '89 VERSION 7.95  (C)                   "CHR$(186)
13 ?" " chr$(204);:for I=1 TO 76:?CHR$(205);:NEXT:?CHR$(185)
30 F=0
40 ?" "CHR$(186)"                                                                            "CHR$(186)
60 ?" "CHR$(186)"                                  DIARIO (C)                                "CHR$(186)
65 ?" "CHR$(186)"                                                                            "CHR$(186)
70 ?" "CHR$(204);:for I=1 TO 76:?CHR$(205);:NEXT:?CHR$(185)
75 ?" "CHR$(186)"                                                                            "CHR$(186)
100?" "CHR$(186)"                                1 - SCHREIBEN                               "CHR$(186)
105?" "CHR$(186)"                                                                            "CHR$(186)
110?" "CHR$(186)"                                2 - LESEN                                   "CHR$(186)
120?" "CHR$(186)"                                                                            "CHR$(186)
130?" "CHR$(186)"                                3 - BEENDEN                                 "CHR$(186)
140?" "CHR$(186)"                                                                            "CHR$(186)
141?" "CHR$(186)"                                                                            "CHR$(186)
145 IF Z=0 THEN PRINT" " CHR$(186)"                            KEINE DATEI GELADEN                             "CHR$(186):D=0:GOTO 154
148?" "CHR$(186)"                                                                            "CHR$(186)
149?" "CHR$(186)"                                                                            "CHR$(186)
150?" "CHR$(186)"                                FILE  "T$ TAB(79) CHR$(186)
154?" "CHR$(186)"                                                                            "CHR$(186)
155?" "CHR$(186)"                                                                            "CHR$(186)
160?" "CHR$(186)"                             WéHLEN SIE BITTE                               "CHR$(186)
161?" "CHR$(186)"                                                                            "CHR$(186)
163?" "CHR$(200);:FOR I=1 TO 76:?CHR$(205);:NEXT:?CHR$(188)
165 H$=INKEY$:IF H$=""THEN 165
202 IF H$="1" THEN 15000
203 IF H$="2" THEN 25000
204 IF H$="3" THEN 30000
205 H$=""
210 GOTO 6
300 cls:?:?:?:?"              Neue Datei îffnen   J/N  ?"
310 X$=INKEY$:IF X$="" THEN 310
320 IF X$="J" OR X$="j" THEN 15000
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
5015 LOCATE 23,1:INPUT"               Bitte geben Sie das gewÅnschte Verzeichnis an!";u$
5016 GH$=u$
5017 CHDIR GH$
5018 CLS
5019 SHELL "DIR/W"
5020 LOCATE 16,3:PRINT"              Bitte Dateiname, nicht mehr als 8 Zeichen benutzen! "
5021 LOCATE 17,3:PRINT"          Die beiden letzten Zeichen fÅr das Jahr. .DAT weglassen !!!"
5030 ?:?:INPUT"              (M)enÅ   (E)nde  !! ";T$
5031 IF T$="M" or T$="m" THEN 5036
5032 IF T$="E" OR T$="e" THEN 5036
5033 K=LEN(T$)-2
5034 SHELL "CD D:\"
5035 GOTO 5041
5036 SHELL "CD.."
5037 SHELL "CD.."
5038 IF T$="M" OR T$="m" THEN 6
5039 END
5041 CLS:X$="":D=1
5042 Y$=RIGHT$(T$,2)
5043 M$=LEFT$(T$,K)
5050 REM
5065 F$=M$+Y$+".DAT"
5066 CH$="DIARIO\"+y$
5067 CHDIR CH$
5070 OPEN F$ FOR INPUT AS #1
5072 Z=1:Y=1
5075 WHILE NOT EOF(1)
5080    REM
5082    LOCATE 13,10
5084    PRINT TAB(20)"LADE    > "T$" <  SATZ ";:PRINT USING "##";Y;
5090       FOR I=1 TO 8
5100       LINE INPUT#1,D$(Y,I)
5110       NEXT I
5111    Z=Z+1:Y=Y+1
5113 WEND
5120 CLOSE#1
5122 Z=Z-1
5125 SHELL "CD.."
5130 SHELL "CD.."
5200 RETURN
10000 CLS:EE=0
10002 IF D=0 THEN T$=""
10005 IF T$=""THEN 10008
10007 GOTO 10022
10008 ?:?:INPUT"               Bitte Dateiname, maximal 8 Zeichen  z.B. xxxxxx95";T$
10009 IF T$=""THEN CLS:GOTO 10008
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
10053 DH$="LETTERS"
10055 HH$="IF NOT DIREXIST "+DH$+" MD "+DH$
10056 SHELL HH$
10059 CHDIR DH$
10160 GOSUB 60000
10113 SHELL "CD.."
10114 DI$="DIARIO"
10115 DJ$="IF NOT DIREXIST "+DI$+" MD "+DI$
10116 SHELL DJ$
10125 SHELL "CD DIARIO"
10126 SH$="IF NOT DIREXIST "+Y$+" MD "+Y$
10127 SHELL SH$
10128 CH$=Y$
10129 CHDIR CH$
10130 GOSUB 60000
10142 SHELL "CD.."
10143 SHELL "CD.."
10145 PRINT:INPUT"          Legen Sie nun eine Disk in Laufwerk A: und drÅcken  J/N";HH$
10147 IF HH$="N" OR HH$="n" THEN 10155
10148 LOCATE 13,1
10149 PRINT"                                                                            "
10150 LOCATE 15,1
10151 PRINT"                                                                            "
10154 GOSUB 42000
10155 O=0:X$=""
10200 RETURN
15000 Z=Z+1:Y=Y+1:CLS
15005 FOR T=1 TO 80:? CHR$(205);:NEXT
15010 ?"             Dateneingabe             Seite "Z
15015 FOR T=1 TO 80:? CHR$(205);:NEXT
15020 O=1
15025 REM
15035    FOR I=1 TO 8
15037       ?:? I;
15040       LINE INPUT D$(Z,I)
15045       IF D$(Z,I)=""THEN D$(Z,I)="---"
15050    NEXT I
15055 FOR T=1 TO 80:? CHR$(205);:NEXT
15060 LOCATE 21,1:PRINT"                           Eingabe OK  J/N "
15070 X$=INKEY$:IF X$=""THEN 15070
15080 IF X$<>"J"AND X$<>"N"AND x$<>"j"AND x$<>"n" THEN 15080
15081 LOCATE 22,1:PRINT"                                                 "
15082 GOSUB 56000
15085 IF X$="N" OR X$="n" THEN BEEP:?:INPUT"             Nein ?  Die Seite ist weg bei N!  J/N ?";EF$
15086 IF EF$="J" OR EF$="j" THEN 15095
15090 IF X$="N"or x$="n"THEN Z=Z-1:Y=Y-1:X$="":O=0:GOTO 6
15095 X$=""
15100 LOCATE 21,1:PRINT"                           NÑchste Seite    J/N "
15110 X$=INKEY$:IF X$=""THEN 15110
15120 IF X$<>"J"AND X$<>"N"AND X$<>"j"AND X$<>"n"THEN 15100
15130 IF X$="J"OR X$="j"THEN X$="":GOTO 15000
15140 GOTO 6
25000 CLS:ZZ=1:X$=""
25007 IF Z=0 THEN 41000
25009 CLS:FOR T=1 TO 80:? CHR$(205);:NEXT
25010 ?TAB(3)"Lesen/éndern          Seite"ZZ"von"Z"           Datei "T$
25020 FOR T=1 TO 80:? CHR$(205);:NEXT
25025 ?:
25040    FOR I=1 TO 8
25050    PRINT I;D$(ZZ,I)
25060    PRINT
25070    NEXT I
25085 FOR T=1 TO 80:? CHR$(205);:NEXT
25090 ?:PRINT"     (V)orwÑrts       (Z)urÅck        (M)enÅ        (é)ndern"
25094 X$=""
25095 X$=INKEY$:IF X$=""THEN 25095
25100 IF X$="V"AND ZZ<Z THEN ZZ=ZZ+1:GOTO 25009
25102 IF X$="v"AND ZZ<Z THEN ZZ=ZZ+1:GOTO 25009
25105 IF X$="V"AND ZZ=Z THEN ZZ=1:GOTO 25009
25107 IF X$="v"AND ZZ=Z THEN ZZ=1:GOTO 25009
25110 IF X$="Z"AND ZZ>1 THEN ZZ=ZZ-1:GOTO 25009
25112 IF X$="z"AND ZZ>1 THEN ZZ=ZZ-1:GOTO 25009
25115 IF X$="Z"AND ZZ=1 THEN ZZ=Z:GOTO 25009
25117 IF X$="z"AND ZZ=1 THEN ZZ=Z:GOTO 25009
25120 IF X$="M"OR X$="m"THEN 6
25130 IF X$="é"OR X$="Ñ"THEN 25150
25140 GOTO 6
25150 INPUT"   Zeile NR.  ";X
25160 IF X<1 OR X>8 THEN 25150
25165 O=1
25170 LINE INPUT"   Neue Eingabe ";D$(ZZ,X)
25180 IF D$(ZZ,X)=""THEN D$(ZZ,X)="---"
25190 GOTO 25009
30000 CLS:X$=""
30010 IF O=1 THEN GOSUB 10000
30020 PRINT:PRINT:PRINT:INPUT"             Mîchten Sie be(E)nden oder (W)eiterarbeiten  E/W ?";EE$
30030 IF EE$="W" OR EE$="w" THEN 5
30040 CLS:PRINT:PRINT:PRINT:PRINT
30050 PRINT"   Achtung, bitte denken Sie daran, mindestens jede Woche SDSCAN auf-"
30055 PRINT"   zurufen, um alle Programme nach Viren untersuchen zu lassen !!!!!"
30057 ?:?:?:?:?:?:?:?:?
30060 For T=1 TO 25000:NEXT T:END
41000 CLS:?:?:?"   KEINE DATEN GESPEICHERT !"
41010 FOR T=1 TO 10000:NEXT T
41020 GOTO 6
42000 SHELL "A:"
42005 rem
42006 SH$="IF NOT DIREXIST "+Y$+" MD "+Y$
42008 SHELL SH$
42009 CH$=Y$
42010 CHDIR CH$
42020 GOSUB 60000
42095 SHELL "CD.."
42100 REM
42110 SHELL "D:"
42120 RETURN
55000 M1$=LEFT$(T$,1):M2$=MID$(T$,2,1):M3$=MID$(T$,3,1)
55010 X=ASC(M1$):Y=ASC(M2$):Z=ASC(M3$)
55020 IF X > 96 THEN X=X-32
55030 IF Y > 96 THEN Y=Y-32
55040 IF Z > 96 THEN Z=Z-32
55050 M4$=CHR$(X)
55060 M5$=CHR$(Y):
55070 M6$=CHR$(Z):
55080 MY$=M4$+M5$+M6$
55090 RETURN
56000 REM:PRINT"                         ....EINEN MOMENT...."
56010 IF F$="" THEN F$="SICHER.SIK"
56012 DH$="SIK"
56015 HH$="IF NOT DIREXIST "+DH$+" MD "+DH$
56020 SHELL HH$
56025 SHELL "CD SIK"
56030 EE=1
56100 GOSUB 60010
56110 SHELL "CD.."
56120 RETURN
60000 CLS
60010 OPEN F$ FOR OUTPUT AS #1
60070 REM
60080    FOR Y=1 TO Z
60082    LOCATE 12,10
60084    IF EE=0 THEN PRINT TAB(22)"SPEICHERE > "T$" <  SATZ ";:PRINT USING "##";Y;
60090       FOR I=1 TO 8
60100       PRINT#1,D$(Y,I)
60110       NEXT I
60111    NEXT Y
60112 CLOSE#1
60115 EE=0
60120 RETURN
