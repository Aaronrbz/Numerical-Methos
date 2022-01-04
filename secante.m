clear
clc
format long
x0= input("Ingrese la aproximacion inicial po\n");
x1= input("Ingrese la aproximacion inicial p1\n");
tol= input("Ingrese la  tolerancia\n");
No=input("Ingrese número de iteraciones\n");
i=2;
%l=89;
%h=49;
%d=55;
%b1= (11.5*pi)/180;
%b=l*cos(b1);
%a=l*sin(b1);
%c=(h+0.5*d)*sin(b1) - (0.5*d)* tan(b1);
%e= (h + 0.5*d)* cos(b1) - 0.5*d* tan(b1);


  q0= x0^3 - 4*x0^2 - 5*x0 +10;
  q1= x1^3 - 4*x1^2 - 5*x1 +10;
  while i<No 
    p= x1 - (q1* ((x1-x0) / (q1-q0)))
      if abs(p - x1)< tol 
        disp(p)
        break;
      endif
      i=i+1;
      x0=x1;
      q0=q1;
      x1=p;
      q1 = p^3 - 4*p^2 - 5*p +10;
     disp(p),
  endwhile
