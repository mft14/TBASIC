10 cls
20 rem
50 print
60 print "****************************************
70 print "*                                      *
80 print "*  rechner c 16,extended version       *
90 print "*                                      *
100 print "*  programmentwickler df9qm            *
110 print "*                                      *
120 print "*  thomas kiel pob.3204 2900 ol        *
130 print "*                                      *
140 print "****************************************
150 for y=1 to 60000:next y
155 goto 1100
160 print chr$(147):print
170 print"       Reichweite von VHF-Sendern"
180 for i=1 to 2000:next i:
190 cls:s=0:h=0:t=0:r=0:d=0:w=0
200 print:print:print:
210 print:print:print:print:
220 print"         fuer den gesuchten wert"
225 print:print
230 print"               0 eingeben"
240 print:print:print:print:
250 print:print:print:
260 input"    sendeleistung in w:    ";s
270 print:print:
280 input"    eingangsspannung in uv:";h
290 print:print:
300 e=h*1e-06
310 input"    antennenhoehe tx in m: ";t
320 print:print:
330 input"    antennenhoehe rx in m: ";r
340 print:print:
350 input"    reichweite in km:      ";d
360 print:print:
370 input"    wellenlaenge in m:     ";w
380 print:print:print:
390 if w=0 then 480
400 f=((2*3.1415926)/w)
410 if s=0 then 700
420 if h=0 then 750
430 if t=0 then 790
440 if r=0 then 830
450 if d=0 then 560
460 if w=0 then 480
470 print:print:
480 print tab(8)"eingabe unvollstaendig"
490 print:print tab(10)" wiederholung j/n";
500 b$=" ":input b$
510 if b$=" "then 950
520 if b$="j"then 190
530 if b$="n"then 650
540 cls: end
550 goto 10
560 cls
570 print"      die reichweite ist"
580 print:print tab(10)sqr((sqr(s)*28*3.1415926*t*r)/(f*e))/1000"km"
590 if d=0 then gosub 880
600 print:print:print:print:print
610 print"    weitere rechnungen  j/n";
620 x$=" ":input x$:if x$=" "then 690
630 if x$="j"then 190
640 if x$="n"then 650
650 print chr$(147)
660 LOCATE 14,12:print"      warum nicht?"
670 for i=1 to 3000:next i:goto 155
680 end
690 print chr$(147):goto 610
700 print"            der sender hat"
710 print:print tab(10)1/(((28*3.1415926*t*r)/((d*d)*f*h))^2)"w"
720 print:print"            sendeleistung"
730 print:print:
740 goto 600
750 print"      die eingangsspannung ist"
760 print:print tab(10)((sqr(s)*28*3.1415926*t*r)/((d*d)*f))"uv"
770 print:print:
780 goto 600
790 print"      die tx-antennenhoehe ist"
800 print:print tab(10)1/((sqr(s)*28*3.1415926*r)/((d*d)*f*h))"m"
810 print:print:
820 goto 600
830 print"      die rx-antennenhoehe ist"
840 print:print tab(10)1/((sqr(s)*28*3.1415926*t)/((d*d)*f*h))"m"
850 print:print:
860 goto 600
870 end
880 print:print:LOCATE 5,5:?"    sichtweite beachten!"
890 print:
900 print:print tab(10)(sqr(r)+sqr(t))*3.6"km"
910 print:print:print" wenn die sichtweite deutlich unter der"
920 print:print" reichweite liegt,ist mit schwaecheren"
930 print:print" signalen zu rechnen (-40db)"
940 return
950 cls:print:print:print:print:print:print:
960 print"          das war wohl nix!"
970 for i=1 to 2000:next i:cls
980 LOCATE 10,12:?"nochmal von vorne!"
990 for i=1 to 5000:next i
1000 goto 10
1100 cls
1101 p=0
1110 print"        bitte waehlen sie!"
1120 ?:print"        hf berechnung     -1-"
1130 ?:print"        log berechnung     -2-"
1140 ?:print"        programm ende     -3-"
1145 print:print:print:print
1150 input"        auswahl  1-3     ";p
1160 if p>3 or p<=0 then 1162
1161 goto 1170
1162 GOSUB 4000
1164 goto 1100
1170 on p goto 160,1200,540
1200 cls:l=0
1201 print"      berechnung  ratio - log  -1-"
1210 ?:print"      berechnung  log - ratio  -2-"
1220 ?:print"      h f  berechnungen  -3-"
1225 ?:print"        programmende     -4-"
1230 print:print:print:print
1240 input"        auswahl  1-4         ";l
1250 if l>4 or l<=0 then 1270
1260 goto 1300
1270 GOSUB 4000
1290 goto 1200
1300 on l goto 2000,3000,155,540
2000 cls:print:print:print:print
2004 b$=""
2005 print:print"  Geben sie bitte einen Ratiowert ein"
2006 print:print:print
2010 input"           ";q
2011 if q=0 then 2013
2012 goto 2016
2013 GOSUB 4000
2015 goto 2000
2016 print:print:print
2020 v=(log(q)/log(10))*10
2025 print using"         ###.## db";v
2030 q=0:v=0
2040 ?:?:?:print"      noch eine berechnung?  j/n"
2050 print:print
2060 input"     ";b$
2070 if b$=""then 2072
2071 goto 2080
2072 GOSUB 4000
2074 cls:goto 2040
2080 if b$="j"then 2000
2090 if b$="n"then 1200
3000 cls:print:print:print:print
3004 b$=""
3005 print:print"  Geben sie bitte einen - db - wert ein"
3006 print:print:print
3010 input"           ";y
3011 if y=0 then 3013
3012 goto 3016
3013 gosub 4000
3015 goto 3000
3016 print:print:print
3017 c=(y/10)
3020 u=10^c
3025 print using"         ###.## ratio";u
3030 y=0:u=0
3040 ?:?:?:print"        noch eine berechnung?  j/n"
3050 print:print
3060 input"     ";b$
3070 if b$=""then 3072
3071 goto 3080
3072 GOSUB 4000
3074 cls:goto 3040
3080 if b$="j"then 3000
3090 if b$="n"then 1200
4000 LOCATE 12,24:?" EINGABEFEHLER"
4010 FOR T=1 TO 5000: NEXT T
4020 RETURN