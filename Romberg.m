clear
clc
format long
a=input("Dame el punto a\n");
b=input("Dame el punto b\n");
n=input("Dame n\n");
fun=input('Introduzcal a funcion f(x)=','s');
f=inline(fun);
h=b-a;
R(1,1)= (h/2)* (f(a)+f(b));
disp(R(1,1));
  for i=2: n
    sum=0;
    for k=1: 2^(i-2)
      sum=sum+f(a+(k-0.5)*h);
    endfor
    R(2,1)= (0.5)*(R(1,1)+h*sum);
      for j=2:i
        R(2,j)=R(2,j-1)+((R(2,j-1)-R(1,j-1))/ (4^(j-1) -1));
      endfor
     h=h/2;
     for j=1:i
       R(1,j)= R(2,j);
       endfor
  endfor
R