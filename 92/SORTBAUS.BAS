25000 cls:?:?:?:?
25005 rt$="":u=0
25010 x=1
25020 h=x+1
25030 ifd$(x,3)=d$(h,3)then 25032
25031 ifd$(x,3)<d$(h,3)then 25070
25032 ifd$(x,3)=d$(h,3) and d$(x,2)=d$(h,2)then 25034
25033 ifd$(x,3)=d$(h,3) and d$(x,2)<d$(h,2)then 25070
25034 ifd$(x,3)=d$(h,3) and d$(x,2)=d$(h,2) and d$(x,1)<=d$(h,1)then 25070:else25040
25035 rem
25040 d$(o,1)=d$(x,1):d$(x,1)=d$(h,1):d$(h,1)=d$(o,1)
25041
25070 h=h+1
25072 if h<=z then 25030
25075 x=x+1
25080 if x<>z then 25020