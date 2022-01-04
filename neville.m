clc
clear
%val=input("Ingrese el numero maximo de valores\n");
%X= input("Dame el valor de X\n");
val=5;
X=(2.5);
x=[2.0 2.2 2.4 2.6 2.8  ];
Q=[1.53192062 1.91548148 2.00055896 1.77242587 1.26623113 ]';
%  for h=1: val
%    fprintf("\n x%d=",h);
%    x(h)= input(" ");
%    fprintf("\n f(x%d)=",h);
%    Q(h,1)=input(" ");
%  endfor
  %[x' Q]
for i=2:val
  for j=2:i
   Q(i,j)= ((X-x(i-j+1))*Q(i,j-1) - (X-x(i))*Q(i-1,j-1)) /(x(i)-x(i-j+1));
  endfor
endfor
mat=[x', Q]
