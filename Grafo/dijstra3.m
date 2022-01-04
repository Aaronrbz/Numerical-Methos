clc
clear
n=12;
Ady=[0 2 2 2.5 3 0 0 0 0 0 0 0; 0 0 0 0 0 3 0 0 0 0 0 0; 0 0 0 0 0 1.5 0 0 0 0 0 0; 0 0 0.5 0 0 0 3 0 0 0 0 0; 0 0 0 3.5 0 0 3 3 0 0 0 0;0 0 0 0 0 0 0 0 9 0 0 0; 0 0 0 0 0 2 0 3 7.5 0 0 0;0 0 0 0 0 0 0 0 0 0 4 0; 0 0 0 0 0 0 0 0 0 7.5 0 4; 0 0 0 0 0 0 0 10 0 0 0 3.5; 0 0 0 0 0 0 0 0 0 6 0 0;0 0 0 0 0 0 0 0 0 0 0 0];
for(i=1:n)
d(i)=inf;
a(i)=i;
per(i)=0;
endfor

s=1;
d(s)=0;
per(s)=1;
p=s;

s=sum(per);

while(s<n)
for(i=1:n)
if(Ady(p,i)!=0 && per(i)==0)
  if(d(i)>d(p)+Ady(p,i))
  d(i)=d(p)+Ady(p,i);
  a(i)=p;
  endif
endif
endfor

min=inf;
minv=0;

for(i=1:n)
if(~per(i) && d(i)<min)
min=d(i);
minv=i;
endif
endfor
%minv

if(min==inf)
msgbox("NO hay arboresencia");
break;
else
p=minv;
per(minv)=1;
endif
s=sum(per);
endwhile
[a;1:12]