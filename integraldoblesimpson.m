clc
clear
fun=input('Introduzcal a funcion f(x,y)=','s');
f=inline(fun);
a= input("Ingrese la aproximacion inicial a\n");
b= input("Ingrese la aproximacion inicial b\n");
c= input("Ingrese la aproximacion inicial c\n");
d= input("Ingrese la aproximacion inicial d\n");
n=input("Dame el valor de n\n");
m=input("Dame el valor de m\n");
j1=0;
j2=0;
j3=0;
h=(b-a)/n

for i=0:n
  x=a+i*h;
  HX=(d -c)/m;
  k1=f(x,c) + f(x,d);
  k2=0;
  k3=0;
    for j=1:m-1
      y=c + j*HX;
      Q=f(x,y);
        if mod(j,2)==0 
          k2=k2+Q;
         else
          k3=k3+Q;
        endif
     endfor
       L=(k1+2*k2+4*k3)*HX/3;
       if i==0 || i==n
         j1=j1+L;
        elseif mod(i,2)==0
       j2=j2+L;
     else
       j3=j3+L;
       endif
endfor
J=h*(j1+2*j2+4*j3)/3;
disp(J);
