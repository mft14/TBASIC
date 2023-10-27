10 cls:?:?:?:?
11 input"   Wann soll die Uhr anhalten ?  (hh,mm)";ss$,st$
12 ?:input"   Wann soll jede Sekunde ein Signal kommen ?  (mm)";si$
13 y=int(rnd*23)+1
14 x=int(rnd*70)+1
15 locate y,x
20 print time$
30 for t=1 to 2500:next
34 if left$(time$,2)=ss$ and mid$(time$,4,2)=st$ then ?:?:?:?"   Ende":end
35 if right$(time$,2)="30" then 50
37 if right$(time$,2)="00" then sound 500,1
38 if mid$(time$,4,2)=si$ then beep
39 if mid$(time$,4,2)="00" and right$(time$,2)="00" then sound 1000,25
40 cls:goto 13
50 cls:for i=1 to 2500:locate 10,3:?"   Anhalten ?    J/N";
60 q$=inkey$:if q$="J" or q$="j" then end
70 next:cls:goto 13