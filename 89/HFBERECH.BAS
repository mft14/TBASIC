10 cls
20 print:print:print
50 print
60 print "          ****************************************
70 print "          *                                      *
80 print "          *  rechner c 16, extended version      *
90 print "          *                                      *
100 print "          *  programmentwickler df9qm            *
110 print "          *                                      *
120 print "          *  thomas kiel pob.3204 2900 ol        *
130 print "          *                                      *
140 print "          ****************************************
150 for y=1 to 6000:next y
155 goto 1100
160 print:print
170 print"       Reichweite von VHF-Sendern"
180 for i=1 to 6000:next i:
190 cls:s=0:h=0:t=0:r=0:d=0:w=0
200 print:print:print:
210 rem
220 print"         F�r den gesuchten Wert"
225 print:print
230 print"          nur Return dr�cken"
240 cls
250 print:print:print:
260 input"    Sendeleistung in W:    ";s
270 print
280 input"    Eingangsspannung in uV:";h
290 print
300 e=h*1e-06
310 input"    Antennenh�he tx in m:  ";t
320 print
330 input"    Antennenh�he rx in m:  ";r
340 print
350 input"    Reichweite in km:      ";d
360 print
370 input"    Wellenl�nge in m:      ";w
380 rem
390 if w=0 then 470
400 f=((2*3.1415926)/w)
410 if s=0 then 700
420 if h=0 then 750
430 if t=0 then 790
440 if r=0 then 830
450 if d=0 then 560
460 if w=0 then 480
470 print:print:
480 print tab(8)"Eingabe unvollst�ndig"
490 print:print tab(10)" Wiederholung j/n";b$
500 Rem
510 if b$=""then 950
520 if b$="j" or b$="J"then 190
530 if b$="n" or b$="N"then 1100
540 cls: end
550 goto 10
560 rem
570 sw=(sqr(r)+sqr(t))*3.6
580 rw=sqr((sqr(s)*28*3.1415926*t*r)/(f*e))/1000
585 print:print:print using "    Die Reichweite ist ######.## km";rw
587 if rw>sw then gosub 900
600 print:print
610 print"    Weitere Rechnungen  j/n";
620 x$=" ":input x$:if x$=" "then 690
630 if x$="j" or x$="J" then 190
640 if x$="n" or x$="N" then 1100	
680 end
690 goto 610
700 Rem
710 sl=1/(((28*3.1415926*t*r)/((d*d)*f*h))^2)
720 print:print using"    Die Sendeleistung betr�gt ####.### Watt";sl
730 print:print:
740 goto 600
750 rem
760 es=((sqr(s)*28*3.1415926*t*r)/((d*d)*f))
770 print:print using"    Die Eingangsspannung betr�gt ####.## uV";es
780 goto 600
790 rem
800 ta=(1/((sqr(s)*28*3.1415926*r)/((d*d)*f*h)))
810 print:print using"    Die Tx Antennenh�he betr�gt ####.# m";ta
820 goto 600
830 rem
840 ra=(1/((sqr(s)*28*3.1415926*t)/((d*d)*f*h)))
850 print:print using"    Die Rx Antennenh�he betr�gt ####.# m";ra
860 goto 600
870 end
900 rem
905 print:print using"    Die Sichtweite ist ######.### km";sw
910 ?" Wenn die Sichtweite deutlich unter der"
920 ?" Reichweite liegt, ist mit schw�cheren"
930 ?" Signalen zu rechnen, u. U. bis -40db!"
940 return
950 cls:print:print:print:print:print:print:
960 print"          das war wohl nix!"
970 for i=1 to 2000:next i:cls
980 LOCATE 10,12:?"nochmal von vorne!"
990 for i=1 to 5000:next i
1000 goto 10
1100 cls
1101 p=0
1110 ?:?:?:?:print"        Bitte w�hlen sie!"
1120 ?:print"        Hf Berechnung     -1-"
1130 ?:print"       Log berechnung     -2-"
1140 ?:print"        Programmunde      -3-"
1145 print:prind:print:print
1150 input"           Auswahl  1-3  ";p
1160 if p>3 or p<=0 then 1162
1161 goto 1170
1162 GOSUB 4000
1164 goto 1100
1170 on p goto 160,1200,540
1200 cls:l=0
1201 ?:?:?:print"      Berechnung  Ratio - log  -1-"
1210 ?:print"      Berechnung  Log - Ratio  -2-"
1220 ?:print"            H F  Berechnungen  -3-"
1225 ?:print"              Programmende     -4-"
1230 print:print:print:print
1240 input"                Auswahl  1-4  ";l
1250 if l>4 or l<=0 then 1270
1260 goto 1300
1270 GOSUB 4000
1290 goto 1200
1300 on l goto 2000,3000,155,540
2000 cls:print:print:print:print
2004 b$=""
2005 print:print:input"  Geben sie bitte einen Ratiowert ein";q
2011 if q=0 then 2013
2012 goto 2016
2013 GOSUB 4000
2015 goto 2000
2016 print:print
2020 v=(log(q)/log(10))*10
2025 print using"         ###.## db";v
2030 q=0:v=0
2040 ?:input"      noch eine Rerechnung?  j/n";b$
2050 print:print
2070 if b$=""then 2072
2071 goto 2080
2072 GOSUB 4000
2074 cls:goto 2040
2080 if b$="j" or b$="J" then 2000
2090 if b$="n" or b$="N" then 1200
3000 cls:print:print:print:print
3004 b$=""
3005 print:print:input"  Geben sie bitte einen - db - Wert ein";y
3006 print:print
3011 if y=0 then 3013
3012 goto 3017
3013 gosub 4000
3015 goto 3000
3017 c=(y/10)
3020 u=10^c
3025 print using"         ###.## Ratio";u
3030 y=0:u=0
3040 ?:input"        noch eine Berechnung?  j/n";b$
3050 print:print
3070 if b$=""then 3072
3071 goto 3080
3072 GOSUB 4000
3074 cls:goto 3040
3080 if b$="j" or b$="J" then 3000
3090 if b$="n" or b$="N" then 1200
4000 LOCATE 12,24:?" EINGABEFEHLER"
4010 FOR T=1 TO 5000: NEXT T
4020 RETURN