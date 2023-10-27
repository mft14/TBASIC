10 cls
11 print:input"   Erst die 6 Faktoren eingeben ";m,n,o,p,q,r
12 print:input"   Bildschirm anhalten J/N ";y$
20 ?:?:input"   Bitte geben sie eine Zahl ein";a1:if a1=0 then a1=1
22 a=a1:b=a1+1:c=a1+2:d=a1+3:e=a1+4:f=a1+5
25 ?:?:input"   Wie oft soll berechnet werden";t:z=t/4:if t=0 then 25
26 print:print"   AUFGABE " "*"m"-"n":"o"+"p"-"q"*"r
27 i=0:print
28 print"PKT";a,b,c,d,e
29 ?"------------------------------------------------------------"
30 for t=1 to z
35 i=i+1:a=a*m:b=b*m:c=c*m:d=d*m:e=e*m
40 print i;a,b,c,d,e
45 i=i+1:a=a-n:b=b-n:c=c-n:d=d-n:e=e-n
50 print i;a,b,c,d,e
55 i=i+1:a=a/o:b=b/o:c=c/o:d=d/o:e=e/o
60 print i;a,b,c,d,e
65 i=i+1:a=a+p:b=b+p:c=c+p:d=d+p:e=e+p
66 print i;a,b,c,d,e
67 i=i+1:a=a-q:b=b-q:c=c-q:d=d-q:e=e-q
68 print i;a,b,c,d,e
69 i=i+1:a=a*r:b=b*r:c=c*r:d=d*r:e=e*r
70 print i;a,b,c,d,e
74 if i=60 then end
75 if y$="n" or y$="N" then 80
76 if i=18 then 100
77 if i=36 then 100
78 if i=48 then 100
80 next t
90 end
100 print
101 rem:print"PKT";a1,a1+1,a1+2,a1+3,a1+4
105 rem:?"-----------------------------------------------------------"
110 input x$:rem:"   weiter -> w  neu -> n faktor -> f ende -> e";x$:
120 if x$="w"then 80
130 if x$="n"then 20
140 if x$="e"then end
145 if x$="f"then 10
150 goto 100
