clear 
clc
a=input("Dame el valor de a\n");
b=input("Dame el valor de b\n");
n=input("Cuantos cuadrados hay entre a y b ");
dx=(b-a)/n;
fun=input('Introduzcal a funcion f(x)=','s');
f=inline(fun);
cent=input("Selecciona hacia donde se hara la suma\n \t --- 1 Derecha --- \t ---- 2 Izquierda ---\t\n");
A=0;
x=a;
  if(cent==1)
    for(i=1 : n)
      x=x+dx;
      A= A + f(x) * dx
    
    endfor
    disp(A)
  elseif(cent==2)
    for(i=1 : n)
    
      A= A + (f(x) * dx)
        x=x+dx;
    endfor
    disp(A)
    endif
  