10 cls
20 ?:?:input"   Bitte geben sie eine Zahl ein";a1
22 a=a1:
25 ?:?:input"   Wie oft soll berechnet werden";t:z=t/4
27 i=0
28 print" "a" "a1"       "
30 for t=1 to z
35 i=i+1
40 a=a*4:print" "a"-"i
45 i=i+1
50 a=a+2:print" "a"-"i
55 i=i+1
60 a=a/2:print" "a"-"i
65 i=i+1
70 a=a+2:print" "a"-"i
75 rem
78 if i=20 or i=40 or i=60 then input"   weiter mit RETURN";x$
80 next t
90 end