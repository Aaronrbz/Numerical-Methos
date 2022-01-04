clear
clc
format long
a=input("Dame el punto a\n");
b=input("Dame el punto b\n");
n=input("Dame n\n");
fun=input('Introduzcal a funcion f(x)=','s');
f=inline(fun);
h=(b-a)/n;
XI0= f(a)+f(b);
XI1=0;
XI2=0;
for i=1: n-1
  X=a+i*h;
  if(mod(i,2)==0)
  XI2=XI2+f(X); 
  else
  XI1=XI1+f(X);
  endif
 endfor
XI= h*(XI0 + 2*XI2 + 4* XI1)/3;
disp(XI); 
