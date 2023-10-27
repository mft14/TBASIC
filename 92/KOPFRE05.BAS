10 cls
11 print:input"   Erst die Faktoren eingeben (4)";m,n,o,p
12 print:input"   Bildschirm anhalten J/N ";y$
20 ?:?:input"   Bitte geben sie eine Zahl ein";a1
22 a=a1:b=a1+1:c=a1+2:d=a1+3:e=a1+4:f=a1+5
25 ?:?:input"   Wie oft soll berechnet werden";t:z=t/4:cls
26 print:print"   AUFGABE " "*"m"+"n":"o"+"p
27 i=0:print
28 print i;a,b,c,d,e
29 ?"------------------------------------------------------------"
30 for t=1 to z
35 i=i+1:a=a*m:b=b*m:c=c*m:d=d*m:e=e*m
40 print i;a,b,c,d,e
45 i=i+1:a=a+n:b=b+n:c=c+n:d=d+n:e=e+n
50 print i;a,b,c,d,e
55 i=i+1:a=a/o:b=b/o:c=c/o:d=d/o:e=e/o
60 print i;a,b,c,d,e
65 i=i+1:a=a+p:b=b+p:c=c+p:d=d+p:e=e+p
70 print i;a,b,c,d,e
74 if i=60 then end
75 if y$="n" or y$="N" then 80
76 if i=16 then 100
77 if i=32 then 100
78 if i=48 then 100
80 next t
90 end
100 print
101 print i;a1,a1+1,a1+2,a1+3,a1+4
105 ?"-----------------------------------------------------------"
110 input"   weiter -> w  neu -> n";x$:
120 if x$="w"then 80
130 if x$="n"then 20
140 if x$="e"then end
150 goto 100
