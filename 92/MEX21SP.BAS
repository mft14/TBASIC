
2 DIM D$(52,21),K$(21),F$(21)
3 PRINT:PRINT:PRINT:PRINT
4 P=0
7 REM
9 REM
10 CLS
11 FOR I=1 TO 40:PRINT"-";:NEXT I:PRINT CHR$(00)
13 PRINT"        A PROGRAMME BY TOM KIEL"
14 FOR I=1 TO 40:PRINT"-";:NEXT I:PRINT CHR$(00)
16 R=0
17 H$="":X$="":GD$="":B$="":DI$="":QW$="":O$="":U$="":J$=""
25 KEY 1,"V":KEY 2,"R":KEY 4,"M"
26 KEY 3,"A":KEY 8,"M"
30 REM
31 F=0
32 K$(1)="                       DATE "
33 K$(2)="20 "
34 K$(3)="19 "
35 K$(4)="18 "
36 K$(5)="17 "
37 K$(6)="16 "
38 K$(7)="15 "
39 K$(8)="14 "
40 K$(9)="13 "
41 K$(10)="12 "
42 K$(11)="11 "
43 K$(12)="10 "
44 K$(13)=" 9 "
45 K$(14)=" 8 "
46 K$(15)=" 7 "
47 K$(16)=" 6 "
48 K$(17)=" 5 "
49 K$(18)=" 4 "
50 K$(19)=" 3 "
51 K$(20)=" 2 "
52 K$(21)=" * "
60 PRINT
70 REM
80 PRINT
90 PRINT"           1   LOAD"
100 PRINT"
110 PRINT"           2   SAVE"
120 PRINT
130 PRINT"           3   WRITE"
140 PRINT
141 PRINT"           4   READ"
142 PRINT
150 PRINT"           5   SORT"
160 PRINT
165 PRINT"           6   SEEK"
166 PRINT
167 PRINT"           7   END"
172 IF Z=0 THEN 174
173 PRINT:PRINT"           FILE "T$
174 PRINT:PRINT"       PLEASE SELECT   1 -> 7  "
175 H$=INKEY$:IF H$="" THEN 175
176 IF H$=CHR$(13)THEN H$="0":BEEP:GOTO 175
178 F=VAL(H$)
200 IF F <=0 OR F>7THEN BEEP:GOSUB 40000
210 ON VAL(H$)GOTO 5000,10000,15000,20000,25000,60000,30000
250 GOTO 10
5000 CLS
5001 C=1:?:?
5008 PRINT"        PLEASE FILENAME !    (19)YY     *=MENU"
5009 PRINT:INPUT"      ";T$
5010 CLS
5012 IF T$="*"THEN 10
5013 IF T$=""THEN BEEP:GOSUB 40000:GOTO 10
5017 CLS:?:?
5018 PRINT"             INSERT VC DISK AND PRESS SPACE":BEEP
5019 ?:?
5020 X$=INKEY$:IF X$<>CHR$(32)THEN 5020
5022 PRINT"                          WAIT !":?:?
5025 SHELL "A:"
5030 OPEN "VC"+T$ FOR INPUT AS #1
5040 INPUT#1,Z
5050    FOR Y=1 TO Z-1
5053    LOCATE 12,10
5055    PRINT"LOADING FILE "T$"    RECORD NUMBER ";:PRINT USING "##";Y;:?" OF"Z
5060       FOR I=1 TO 21
5061       INPUT#1,D$(Y,I)
5062       NEXT I
5063    NEXT Y
5064    REM:FOR Y=18 TO 18
5065       REM:FOR I=1 TO 21
5066    REM:NEXT I:NEXT Y
5067    REM:FOR Y=19 TO Z
5068       REM:FOR I=1 TO 21
5069       REM:INPUT#1,D$(Y,I)
5070    REM:NEXT I:NEXT Y
5100 CLOSE 1
5105 CLS:
5110 SHELL "C:\TBASIC"
5160 GOTO 50000
10000 CLS
10001 REM===============================
10002 REM       SAVE FILE
10003 REM===============================
10011 P$=""
10020 IF Z=0 THEN 10040
10030 GOTO 10100
10040 CLS:?:?:PRINT"          CANNOT SAVE NOTHING ":BEEP
10060 FOR T=1 TO 9000:NEXT
10090 GOTO 10
10100 IF T$="" THEN 10110
10105 GOTO 10120
10110 CLS:PRINT"                  WRITE NEW FILENAME!"
10115 PRINT:PRINT:INPUT"        ";T$
10120 IF T$=""THEN BEEP:GOTO 10100
10125 IF T$="*"THEN BEEP: GOTO 35000
10130 IF T$=CHR$(32)THEN BEEP:GOTO 10100
10132 ?:?:?:?"          INSERT VC DISK IF NECESSARY  PRESS SPACE":BEEP
10133 X$=INKEY$:IF X$<>CHR$(32)THEN 10133
10134 ?:?:?:PRINT"                O.K. ERASING FILE   Y/N   "
10135 GD$=INKEY$:IF GD$=""THEN 10135
10140 if GD$<>"Y"THEN 10
10165 ?:?:PRINT"                 ERASING OLD FILE "T$" NOW
10170 SHELL "A:"
10210 CLS:?:?
10220 OPEN "VC"+T$ FOR OUTPUT AS #1
10230 PRINT#1,Z-1
10240    FOR Y=1 TO Z
10243    LOCATE 10,10
10245    PRINT"SAVING FILE "T$"      RECORD NUMBER ";:PRINT USING "##";Y;:?" OF"Z
10250       FOR I=1 TO 21
10260       PRINT#1,D$(Y,I)
10270       NEXT I
10280    NEXT Y
10290 CLOSE 1
10291 P=0:
10300 SHELL "C:\TBASIC"
10360 REM
10370 PRINT:PRINT:PRINT:PRINT:
10390 PRINT:PRINT"              READY SAVING FILE "T$
10395 ?:PRINT"              PRESS  - W - !!":BEEP
10400 B$=INKEY$:IF B$<>"W"THEN 10400
10410 S=2:GOTO 10
15000 CLS
15001 REM===============================
15002 REM      WRITE FILE
15003 REM===============================
15004 P=1
15010 Z=Z+1
15020 REM
15030 PRINT" WRITE FILE      FILE "T$"      PAGE"Z:PRINT
15060 FOR I=1 TO 21
15065 PRINT K$(I);
15070 INPUT D$(Z,I)
15080 NEXT
15090 PRINT "            INPUT RIGHT   ?  Y/N "
15100 X$=INKEY$:IF X$="" THEN 15100
15110 IF X$<>"Y"AND X$<>"N"THEN BEEP:GOTO 15100
15120 IF X$="Y"THEN 15140
15130 IF X$="N"THEN Z=Z-1:GOTO 10
15140 X$=""
15150 PRINT"             NEXT PAGE    ?  Y/N   ":
15160 X$=INKEY$:IF X$="" THEN 15160
15170 IF X$<>"Y"AND X$<>"N"THEN BEEP:GOTO 15160
15180 IF X$="Y"THEN 15000
15190 IF X$="N"THEN 50000
20000 REM =========================
20010 REM  CHANGE DATAS
20020 REM =========================
20030 ZZ=1
20031 KEY 4,"H":KEY 5,"J":KEY 3,"A"
20040 IF Z<1 THEN 20045
20044 GOTO 20050
20045 ?:PRINT"        NO DATA AVAILABLE":BEEP
20046 FOR T=1 TO 8000:NEXT:GOTO 10
20050 CLS
20060 REM
20065 CLS
20066 PRINT"FILE "T$"  PAGE"ZZ"OF"Z"  DATE: "D$(ZZ,1)
20067 PRINT"----------------------------------------"
20070 FOR I=2 TO 21
20080 PRINT K$(I);D$(ZZ,I)
20090 NEXT
20091 PRINT"----------------------------------------"
20093 PRINT"F1=> F2=< F3=CH. F4=LIST PX=F5  F8=MENU";
20100 X$=INKEY$:IF X$="" THEN 20100
20101 IF X$<>"V" AND X$<>"R"AND X$<>"A"AND X$<>"M"AND X$<>"H"AND X$<>"J"THEN BEEP:GOTO 20100
20110 IF X$="M" THEN 10
20120 IF X$="V" AND ZZ<Z THEN ZZ=ZZ+1:GOTO 20040
20122 IF X$="V" AND ZZ=Z THEN ZZ=1:GOTO 20040
20125 IF X$="R" AND ZZ>1 THEN ZZ=ZZ-1:GOTO 20040
20130 IF X$="R" AND ZZ=1 THEN ZZ=Z:GOTO 20040
20131 IF X$="H"THEN 50000
20140 IF X$="A" THEN 20155
20141 IF X$="J"THEN 20143
20142 GOTO 20150
20143 BEEP:PRINT"   PAGE X  ( 1 -"Z")";
20144 INPUT"   ";G:IF G<0 THEN 20143
20145 IF G>Z THEN 20143
20146 W=G-1
20147 ZZ=1
20148 ZZ=ZZ+W:GOTO 20040
20150 FE$="INPUT ERROR ?!":BEEP:GOTO 20100
20155 BEEP:INPUT"   RECORD # ? (1-21)";X
20156 IF X=21THEN X=1:GOTO 20180
20157 IF X=20THEN X=2:GOTO 20180
20158 IF X=19THEN X=3:GOTO 20180
20159 IF X=18THEN X=4:GOTO 20180
20160 IF X=17THEN X=5:GOTO 20180
20161 IF X=16THEN X=6:GOTO 20180
20162 IF X=15THEN X=7:GOTO 20180
20163 IF X=14THEN X=8:GOTO 20180
20164 IF X=13THEN X=9:GOTO 20180
20165 IF X=12THEN X=10:GOTO 20180
20166 IF X=10THEN X=12:GOTO 20180
20167 IF X=9THEN X=13:GOTO 20180
20168 IF X=8THEN X=14:GOTO 20180
20169 IF X=7THEN X=15:GOTO 20180
20170 IF X=6THEN X=16:GOTO 20180
20171 IF X=5THEN X=17:GOTO 20180
20172 IF X=4THEN X=18:GOTO 20180
20173 IF X=3THEN X=19:GOTO 20180
20174 IF X=2THEN X=20:GOTO 20180
20175 IF X=1THEN X=21:GOTO 20180
20180 IF X<1 OR X>21 THEN 20155
20190 P=1
20200 INPUT"NEW INPUT   ";D$(ZZ,X)
20205 IF D$(ZZ,X)=""THEN D$(ZZ,X)="---"
20210 GOTO 20040
25000 REM ===================
25001 REM   SORT  DATAS
25002 REM ===================
25003 U=0:CLS
25005 IF Z<1 THEN ?:?"        NO DATA AVAILABLE !":BEEP:FOR T=1 TO 8000:NEXT:GOTO 10
25010 X=1
25020 H=X+1
25030 IF MID$(D$(X,1),4,2)=MID$(D$(H,1),4,2) THEN 25032
25031 IF MID$(D$(X,1),4,2)<MID$(D$(H,1),4,2) THEN 25060
25032 IF MID$(D$(X,1),4,2)=MID$(D$(H,1),4,2) AND MID$(D$(X,1),1,2)<MID$(D$(H,1),1,2)THEN 25060
25033 D$(O,1)=D$(X,1):D$(X,1)=D$(H,1):D$(H,1)=D$(O,1)
25034 D$(O,2)=D$(X,2):D$(X,2)=D$(H,2):D$(H,2)=D$(O,2)
25035 D$(O,3)=D$(X,3):D$(X,3)=D$(H,3):D$(H,3)=D$(O,3)
25036 D$(O,4)=D$(X,4):D$(X,4)=D$(H,4):D$(H,4)=D$(O,4)
25037 D$(O,5)=D$(X,5):D$(X,5)=D$(H,5):D$(H,5)=D$(O,5)
25038 D$(O,6)=D$(X,6):D$(X,6)=D$(H,6):D$(H,6)=D$(O,6)
25039 D$(O,7)=D$(X,7):D$(X,7)=D$(H,7):D$(H,7)=D$(O,7)
25040 D$(O,8)=D$(X,8):D$(X,8)=D$(H,8):D$(H,8)=D$(O,8)
25041 D$(O,9)=D$(X,9):D$(X,9)=D$(H,9):D$(H,9)=D$(O,9)
25042 D$(O,10)=D$(X,10):D$(X,10)=D$(H,10):D$(H,10)=D$(O,10)
25043 D$(O,11)=D$(X,11):D$(X,11)=D$(H,11):D$(H,11)=D$(O,11)
25044 D$(O,12)=D$(X,12):D$(X,12)=D$(H,12):D$(H,12)=D$(O,12)
25045 D$(O,13)=D$(X,13):D$(X,13)=D$(H,13):D$(H,13)=D$(O,13)
25046 D$(O,14)=D$(X,14):D$(X,14)=D$(H,14):D$(H,14)=D$(O,14)
25047 D$(O,15)=D$(X,15):D$(X,15)=D$(H,15):D$(H,15)=D$(O,15)
25048 D$(O,16)=D$(X,16):D$(X,16)=D$(H,16):D$(H,16)=D$(O,16)
25049 D$(O,17)=D$(X,17):D$(X,17)=D$(H,17):D$(H,17)=D$(O,17)
25050 D$(O,18)=D$(X,18):D$(X,18)=D$(H,18):D$(H,18)=D$(O,18)
25051 D$(O,19)=D$(X,19):D$(X,19)=D$(H,19):D$(H,19)=D$(O,19)
25052 D$(O,20)=D$(X,20):D$(X,20)=D$(H,20):D$(H,20)=D$(O,20)
25053 D$(O,21)=D$(X,21):D$(X,21)=D$(H,21):D$(H,21)=D$(O,21)
25054 LOCATE 10,1
25055 PRINT:PRINT"   COMPARING # "X" TO # "H:FOR T=1 TO 100:NEXT
25060 H=H+1
25070 IF H<=Z THEN 25030
25080 X=X+1
25090 if X<>Z THEN 25020
25100 GOTO 50000
30000 REM===============================
30001 REM        END FILE
30002 REM===============================
30008 IF P>3 THEN 30100
30009 IF Z=0 THEN 30100
30010 ?:?"       ALL DATA SAVED ?   Y/N ":BEEP
30020 X$=INKEY$:IF X$=""THEN 30020
30030 IF X$<>"Y" THEN 10
30040 CLS
30082 IF P=0 OR P=>3 THEN 30100
30090 IF P=1 OR P=2 THEN 30110
30100 CLS:END
30110 PRINT:PRINT:PRINT:PRINT:PRINT"       DATA NOT YET SAVED":BEEP
30120 P=P+1:FOR T=1 TO 9000:NEXT T:GOTO 10
35000 CLS:PRINT"             DON'T USE THE JOKER >*< AS FILENAME":BEEP
35010 FOR T=1 TO 5000:NEXT
35020 T$="":GOTO 10
40000 CLS:?:?:?:PRINT"          ? "H$" ? INPUT ERROR??? ":PRINT
40005 FOR T=1 TO 8000:NEXT T:BEEP
40010 RETURN
42000 CLS:?:?:?:PRINT"          LOADING NO FILE     ":BEEP
42010 FOR T=1 TO 8000:NEXT
42020 RETURN
50000 CLS:PRINT"      "Z" TOP TWENTIES AVAILABLE":PRINT:
50001 S=0:Q$="":O$=""
50002 m$="":j$=""
50010 FOR Y=1 TO Z
50019 PRINT:PRINT Y;TAB(8);D$(Y,1);TAB(21);D$(Y,21)
50020 S=S+1
50021 IF S=Z THEN 50065
50022 IF S=>9 THEN 50025
50023 GOTO 50060
50025 PRINT:PRINT:PRINT"       >>SPACE   R=REPEAT   M=MENU   "
50026 M$=INKEY$:IF M$<>CHR$(32)AND M$<>"R"AND M$<>"M"THEN 50026
50027 CLS:BEEP
50028 IF M$=CHR$(32)THEN S=0:GOTO 50060
50029 IF M$="R"THEN 50001
50030 REM
50031 IF M$="M"THEN 10
50060 NEXT Y
50065 ?:PRINT"   END OF FILE    R=REPEAT  M=MENU "
50070 J$=INKEY$:IF J$<>"M"AND J$<>"R"THEN 50070
50071 IF J$="R"THEN 50000
50072 REM
50073 IF J$="M"THEN 10
55000 REM ===================
55001 REM    SEEK  DATAS
55002 REM ===================
60000 CLS:ch$="":MO$="":DA$=""
60010 IF Z<1 THEN GOSUB 42000:BEEP:GOTO 10
60020 PRINT"    SEARCHING WHAT ?"
60030 ?:?:?
60050 IF Z>1THEN PRINT"    MONTH      M   ":?:?
60060 IF Z>1THEN PRINT"    CHARTS     *  ":?:?
60070 X$=INKEY$:IF X$<>"*"AND X$<>"M"THEN 60070
60080 IF X$="M"THEN 60110
60090 CH$="":DA$="":MO$=""
60100 IF X$="*"THEN CH$="*":GOTO 60130
60110 CH$="":DA$="":MO$=""
60120 PRINT"  ":INPUT"  MONTH   ";MO$
60130 FOR Y=1 TO Z
60140 S=0
60150 IF CH$=""THEN 60180
60160 IF CH$=RIGHT$(D$(Y,1),1)THEN S=S+1
60170 REM
60180 IF MO$=MID$(D$(Y,1),4,2)THEN S=S+1
60190 IF Y>Z THEN PRINT"   FILE NOT FOUND":BEEP:FOR T=1 TO 2000:NEXT:GOTO 10
60200 IF S<>1 THEN 60280
60210 CLS
60220 FOR I=1 TO 21
60230 PRINT K$(I);D$(Y,I)
60240 NEXT I
60245 PRINT"-----------------------------------"
60250 PRINT"   SPACE  S EARCH OR  E ND       RECORD #"Y
60260 X$=INKEY$:IF X$<>CHR$(32)AND X$<>"S"AND X$<>"E"THEN 60260
60270 IF X$="S"THEN 60000
60280 IF X$="E"THEN Y=Z:GOTO 10
60290 NEXT Y
60300 GOTO 10




