10 cls:f=0:h$=""
20 ?:?
30 ?"   WHRUNGSUMRECHNUNG"
40 ?:input"   Bitte Land eingeben !";l$
50 ?:input"   Bitte den DM Betrag eingeben";d
60 gosub 100
70 c=f*d
80 ?:?:?:?:?"   Sie erhalten fr "d" DM "c" "h$
90 end
100 if l$="Polen" then f=9800 :h$="Zloty"
110 if l$="England" then f=(1/2.54):h$="Pfund"
120 if l$="Holland" then f=1.1:h$="Gulden"
130 return
