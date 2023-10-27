1 rem:DEFSNG "A-Z": REM AtariST Omikron.Basic only
10 REM Program Diplexer (Tschebysheff-type)
20 REM Jean-Luc Dugas May 15,1986 / RF-Design Nov.86 and March91(FilterHandbook)
30 DIM Table(7)
40 INPUT "(1) For Low/High Pass, (2) For Band Pass/Stop ";A
50 IF A<>1 AND A<>2 THEN GOTO 40
60 INPUT "Order 3, 5, or 7 ";Order
70 DATA 1.5133,1.509,.7164
80 DATA 1.561,1.8069,1.7659,1.4173,.6507
90 DATA 1.5748,1.8577,1.921,1.827,1.734,1.3786,.6307
100 IF Order=3 THEN RESTORE 70 ELSE IF Order=5 THEN RESTORE 80 ELSE IF Order=7 THEN RESTORE 90 ELSE GOTO 60
110 INPUT "Impedance Z/ê ";Z
120 FOR N=1 TO Order
130 READ Table(N): REM Read normalized values
140 NEXT N
150 ON A GOSUB 210,480: REM Select Filter type
160 INPUT "New calculation (Y/N) ";Yes$
170 PRINT
180 IF Yes$<>"N" AND Yes$<>"n" THEN GOTO 40
190 END
200 REM ** Low Pass  High Pass Section **
210 INPUT "Cut Off Frequency/Hz ";Fc
220 Wc=6.28319*Fc
230 PRINT TAB (10);"** Low Pass Section **"
240 FOR N=1 TO Order STEP 2
250 Test=Table(N)*Z/Wc: REM L(N)
260 GOSUB 940
270 Lin$="L"+ STR$(N)+Test$+"H"
280 IF N=Order THEN GOTO 320
290 Test=Table(N+1)/(Z*Wc): REM C(N+1)
300 GOSUB 940
310 Lin$=Lin$+"     C"+ STR$(N+1)+Test$+"F"
320 PRINT Lin$: REM Output results of L(N), C(N+1)
330 NEXT N
340 PRINT TAB (10),"** High Pass Section **"
350 FOR N=1 TO Order STEP 2
360 Test=1/(Table(N)*Wc*Z): REM C(N)
370 GOSUB 940
380 Lin$="C"+ STR$(N)+Test$+"F"
390 IF N=Order THEN GOTO 430
400 Test=Z/(Wc*Table(N+1)): REM L(N+1)
410 GOSUB 940
420 Lin$=Lin$+"     L"+ STR$(N+1)+Test$+"H"
430 PRINT Lin$: REM Output results C(N), L(N+1)
440 NEXT N
450 RETURN
460 REM
470 REM
480 PRINT TAB (10);"** Band Pass / Band Stop **"
490 INPUT "Low Frequency/Hz ";F1
500 W1=6.28319*F1
510 INPUT "High Frequency/Hz ";F2
520 W2=6.28319*F2
530 PRINT TAB (10),"** Band Pass Section **"
540 FOR N=1 TO Order STEP 2
550 Test=(F2-F1)/(W1*F2*Z*Table(N)): REM C(N)
560 GOSUB 940
570 Lin$="C"+ STR$(N)+Test$+"F"
580 Test=Z*Table(N)/(W2-W1): REM L(N)
590 GOSUB 940
600 Lin$=Lin$+"   L"+ STR$(N)+Test$+"H    Serial Con.  Serial Res."
610 PRINT Lin$: REM Output Results C(N), L(N)
620 IF N=Order THEN GOTO 700
630 Test=Table(N+1)/((W2-W1)*Z): REM C(N+1)
640 GOSUB 940
650 Lin$="C"+ STR$(N+1)+Test$+"F"
660 Test=Z*(F2-F1)/(W1*F2*Table(N+1)): REM L(N+1)
670 GOSUB 940
680 Lin$=Lin$+"   L"+ STR$(N+1)+Test$+"H    Parall Con.  Parall Res."
690 PRINT Lin$: REM Output Result: C(N+1), L(N+1)
700 NEXT N
710 PRINT TAB (10),"** Band Stop Section **"
720 FOR N=1 TO Order STEP 2
730 Test=1/(Table(N)*(W2-W1)*Z): REM C(N)
740 GOSUB 940
750 Lin$="C"+ STR$(N)+Test$+"F"
760 Test=(F2-F1)*Table(N)*Z/(W2*F1): REM L(N)
770 GOSUB 940
780 Lin$=Lin$+"   L"+ STR$(N)+Test$+"H    Serial Con.  Parall Res."
790 PRINT Lin$: REM Outputt Results C(N), L(N)
800 IF Order THEN GOTO 880
810 Test=Table(N+1)*(F2-F1)/(W2*F1*Z): REM C(N+1)
820 GOSUB 940
830 Lin$="C"+ STR$(N+1)+Test$+"F"
840 Test=Z/(Table(N+1)*(W2-W1)): REM L(N+1)
850 GOSUB 940
860 Lin$=Lin$+"   L"+ STR$(N+1)+Test$+"H    Parall Con.  Serial Res."
870 PRINT Lin$: REM Output Results C(N+1), L(N+1)
880 NEXT N
890 RETURN
900 REM
910 REM
920 REM Eng notation and string manipulation
930 REM
940 I=0
950 WHILE Test<=1 AND I<5
960 Test=Test*1000
970 I=I+1
980 WEND
990 IF I=0 THEN GOTO 1030
1000 Denom$="mænpf"
1010 Test$="= "+ LEFT$( STR$(Test),7)+" "+ MID$(Denom$,I,1)
1020 RETURN
1030 Test$="= "+ LEFT$( STR$(Test),7)+"?  ": REM Failure to find Eng Not.
1040 RETURN
9999 REM BASIC program for computation of diplexer filter component values.
