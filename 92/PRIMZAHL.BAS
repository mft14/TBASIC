5 cls
10 ?:?"   Bis zu welcher Grenze sollen Primzahlen angegeben werden?";
30 input z
40 print"2 ";
50 let n=2
60 let m=2
70 let e=sqr(n)
80 let q=n/m
90 if q=int(q) then 130
100 let m=m+1
110 if m<=e then 80
120 ?n;
130 let n=n+1
140 if n<=z then 60
150 end
