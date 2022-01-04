format long
clear 
clc
n=3;%input('ingresa el numero de elementos: ');
X=[8.1 8.3 8.6 8.7];
F=[16.9440989 17.56492077 18.50515495 18.820991032];
dx=[3.091864062 3.116255515 3.151762203 3.163323026];
%for i=1:n
 %   fprintf("Intruduce X%d",i-1);
  %  X(i)=input('= '); 
   % fprintf("Intruduce F(x)%d",i-1);
    % F(i)=input('= ');
     %fprintf("Intruduce F'(x)%d",i-1);
      %dx(i)=input('= '); 
%end


for i=1:n
    Z(2*i-1)=X(i);
    Z(2*i)=X(i);
    Q((2*i)-1,1)=F(i);
    Q(2*i,1)=F(i);
    Q(2*i,2)=dx(i);
    if i~=1
        Q(2*i-1,2)=(Q(2*i-1,1)-Q(2*i-2,1))/(Z(2*i-1)-Z(2*i-2));
    end
end
for i=3:2*n
    for j=3:i
       Q(i,j)=(Q(i,j-1)-Q(i-1,j-1))/(Z(i)-Z(i-j+1));
    end
end

archivo = fopen('hermite.wxm','wt');
  
 fprintf(archivo,'/* [wxMaxima batch file version 1] [ DO NOT EDIT BY HAND! ]*/');
 fprintf(archivo,'\n/* [ Created with wxMaxima version 19.01.2x ] */');
 fprintf(archivo,'\n/* [wxMaxima: input   start ] */');
 fprintf(archivo,'\nexpand('); 
  
 fprintf(archivo, '(%f)',Q(1,1));
 
 for i=2:2*n
   fprintf(archivo, '+(%f)',Q(i,i));
   
   for j=1:i-1
     fprintf(archivo,'*(x-%1.2f)',Z(j));
   endfor
   
 endfor
  fprintf(archivo,');'); 
  fprintf(archivo,'\n/* [wxMaxima: input   end   ] */'); 
  fprintf(archivo,'\n/* Old versions of Maxima abort on loading files that end in a comment. */');
  fprintf(archivo,'\n"Created with wxMaxima 19.01.2x"$');  
 
 fclose(archivo)
 