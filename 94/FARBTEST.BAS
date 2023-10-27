10 cls
20 ?:?:?:?"   Dies ist ein Farbtestprogramm.
30 ?:?"   Man mu· sich allerdings die Farbennummern merken.
40 ?:?"   Nach jeder Farbkombination die Leertaste drÅcken !
50 rem
60 for x=0 to 15
70 for y=0 to 15
75 color x,y
80 print"   "x"   "y
90 x$=inkey$:if x$=""then 90
100 next y
110 next x
120 ?:?:?"   Passende Kombination gefunden ?
130 ?:?"   dann hier die Werte durch Komma getrennt eingeben:
140 input x,y
150 color x,y
160 ?:?:?:?"   Das war's wohl ?"
170 end