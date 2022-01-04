clc
format long
clear
clc
po=input("Ingresa la po \n");
tol= input("Ingresan la tolerancia\n");
No=input("Ingrese número de iteraciones\n");
  i=1;
  ban =1;
    while(i<No)
    p= ( (po^3-4*po^2+5*po + 10))/(3*po^2 - 8*po +5);#Ingresar la funcion
     disp(p);
      if(abs(p-po) < tol)
      ban =2;
      disp(p);
        break;
      endif
      i = i+1;
      po=p;
    endwhile
     
     if (ban == 1)
       disp("El metodo fracasó:,v");
     else
       disp("El método fue éxitoso, el valor es: \n");
       p
       endif
      
    