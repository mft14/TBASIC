100 cls:input"eigene Breite in Grad,Minuten,Sekunden";bg,bm,bs
110 input"eigene L„nge in Grad,Minuten";lg,lm,ls
120 input"fremde Breite in Grad,Minuten";fg,fm,fs
130 input"fremde L„nge in Grad,Minuten";gl,ml,sl
140 bs=(bs/3600):bm=(bm/60)+bs:bg=bg+bm
150 ls=(ls/3600):lm=(lm/60)+ls:lg=lg+lm
160 fs=(fs/3600):fm=(fm/60)+fs:fg=fg+fm
170 sl=(sl/3600):ml=(ml/60)+sl:gl=gl+ml
180 l=lg-gl
190 if l>180 then l=l-360
200 if l<-180 then l=l+360
210 a=bg:b=fg:?l
220 cs=cos(l):rem:ct=1/tan(l)
230 ?"  cos l";cs"  cot l";ct
240 end
