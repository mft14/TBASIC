 5 CLS:?:?:?"   LOTTOPROGRAMM":?:?
10 INPUT"   BITTE ZAHL EINGEBEN";X
20 randomize X
25 ?:?:?
30 key off:s=0
35 s=s+1
40 a=int(rnd*43)+1
50 b=int(rnd*44)+1
60 c=int(rnd*45)+1
70 d=int(rnd*46)+1
80 e=int(rnd*47)+1
90 f=int(rnd*48)+1
100 if a=>b then 40
110 if b=>c then 40
120 if c=>d then 40
130 if d=>e then 40
140 if e=>f then 40
145 color 0,7
150 print TAB(1)a;TAB(6)b;TAB(11)c;TAB(16)d;TAB(21)e;TAB(26)f;
155 print
160 if s=6 then 180
170 goto 35
180 end