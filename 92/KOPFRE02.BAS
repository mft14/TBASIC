10 cls
20 ?:?:input"   Bitte geben sie eine Zahl ein";a
25 ?:?:input"   Wie oft soll berechnet werden";b:z=b/4
27 i=0
30 for t=1 to z
35 i=i+1
40 b=a*2:print"   "b;:print,i
45 i=i+1
50 c=b-2:print"   "c;:print,i
55 i=i+1
60 d=c/2:print"   "d;:print,i
65 i=i+1
70 e=d+7:print"   "e;:print,i
75 a=e
78 if i=20 or i=40 or i=60 then input"   weiter mit RETURN";x$
80 next t
90 end