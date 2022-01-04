format long
clear 
clc
p0= input("Ingrese la aproximacion inicial po\n");
tol= input("Ingrese la  tolerancia\n");
No=input("Ingrese número de iteraciones\n");
i=1;
con=0;
ban=0;
    while(i<=No)
    p1=  p0 - ( (p0^3-4*p0^2-5*p0+10))/(3*p0^2 - 8*p0 - 5) %funcion evaluada en p0,
    p2= p1 - ( (p1^3-4*p1^2-5*p1+10))/(3*p1^2 - 8*p1 - 5); %funcion evaliuada en p1
    p= p0- (p1 - p0)^2 / (p2 - 2*p1 + p0);
    con=con+1;
  disp(p)
      if(abs(p - p0) <tol)
      fprintf("Fin del metodo\n ");
        ban=1;
      break;
     endif
     i=i+1;
     p0=p;
   endwhile 
 if(ban==1)
  fprintf("El metodo es exitoso despues de %d intentos, el valor es %f\n",con,p);
else
   fprintf("El metodo fracasa despues de %d intentos",con);
endif  
    