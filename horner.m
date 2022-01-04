format long
clc
clear
n= input("Dame el grado del polinomio\n");

  for k=1: n+1
    a(k)= input("Dame el coeficiente\n");
  endfor
  y= a(n+1);
  z= a(n+1);
  x0= input("Ingrese X0\n");
  for j=n: -1:2
    y= (x0*y) + a(j);
    z= (x0*z) + y;
  endfor
  y= (x0*y) + a(1);
  y
  z
