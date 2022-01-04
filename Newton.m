clear
clc
format long
x= input("Ingrese la aproximacion inicial po\n");
tol= input("Ingrese la  tolerancia\n");
No=input("Ingrese número de iteraciones\n");
i=1;
ban=1;
con=1;

  while(i<= No)
     p= x-((x - (4*x^2)-5*x +10)/ (3*x^2 - 8*x-5)); %Valores de la funcion
     disp(p);
     if abs(p-x)< tol
       ban=2;
       disp(p);
       break;
     endif
     i=i+1;
     con=con+1;
     x=p;
  endwhile
  if (ban==2)
    disp("El metodo funciona con : \n");
    disp(con);
    disp(" iteraciones\n");
  else
    disp("El metodo no funciona");
  endif  
  