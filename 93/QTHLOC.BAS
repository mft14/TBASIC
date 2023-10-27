10 pi=3.1415926:p=pi/180:f=40000/(2*pi)
20 cls
25 ?:?:input"           Entfernungs- oder Umrechnung E/U";u$
27 if u$="u" or u$="U" then 240
30 ?:?:?
40 input"           Eigener QTH-LOCATOR";qe$:qf$=qe$
50 gosub 360:le=lf:be=bf
60 fl=1
70 ?:?:?:input"           Fremder QTH-LOCATOR";qf$
80 if qf$="Ende"then goto 170
90 if qf$=qe$ then ?:input"           KM";dx:goto 140
100 gosub 360:ga=lf-le:b=bf-be
110 rem
120 n=sin(be)*sin(bf)+cos(be)*cos(bf)*cos(ga)
130 dx=int((-atn(n/sqr(1-n*n))+pi/2)*f+0.5)
140 q=q+1:su=su+dx
150 if dx>odx then odx=dx
160 ?:?"           Entfernung="dx"KM.":?:goto 70
170 cls
180 ?:?:?tab(12) q"QSO'S="su"KM.":?
190 ?:?"           Schnitt:"int(su/q+0.5)"KM/QSO."
200 ?:?"           Weiteste Verbindung:"odx
210 end
240 cls
250 ?:?:?:input"           Geographische L„nge ";l,lm
260 ?:?:input"           Geographische Breite ";b,bm
270 l=l+lm/60:b=b+bm/60:bi=(b+90)*0.1
280 li=(l+180)/20:if li>18 then li=li-18
290 a$=a$+chr$(65+int(li))+chr$(65+int(bi))
300 li=(li-int(li))*10:bi=(bi-int(bi))*10
310 a$=a$+chr$(48+int(li))+chr$(48+int(bi))
320 li=(li-int(li))*24:bi=(bi-int(bi))*24
330 a$=a$+chr$(65+int(li))+chr$(65+int(bi))
340 ?:print"           Der gesuchte Locator ist: "a$:end
350 rem:umrechnung l„nge-breite
360 if len(qf$)<>6 then gosub 500:print:?"           Falscher Locator eingegeben":goto 20
370 for n=1 to 6
372 t$(n)=mid$(qf$,n,1)
374 next n
380 for n=1 to 2
390 rem:if asc(t$(n))<65 or asc(t$(n))>82 then 500
400 rem:if asc(t$(n+2))<48 or asc(t$(n+2))>57 then 500
410 rem:if asc(t$(n+4))<65 or asc(t$(n+4))>88 then 500
420 next n
430 lf=(asc(t$(1))-65)*20-180+val(t$(3))*2+(asc(t$(5))-65)/12+1/24
440 bf=(asc(t$(2))-65)*10-90+val(t$(4))+(asc(t$(6))-65)/24+1/48
450 lf=lf*p:bf=bf*p:return
460 if fl=0 then 500
470 goto 70
500 ?:?:?:?"           Eingabefehler":for t=1 to 9000:next:GOTO 20
