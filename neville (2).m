%METODO DE NEVILLE
fprintf('\n');
clear all
clc
fprintf('                                   -----------------\n')
fprintf('                                   MÉTODO DE NEVILLE\n')
fprintf('                                   -----------------\n')
fprintf('\n');
syms x
res=input('- La Funcion le fue dada(Si=1,No=0)?     : ');
if res==1
   fun=input('- Introduzca la Funcion F(x)             : ','s');
end
Xi=input('- Introduzca la cantidad para aproximar  : ');
n=input('- Introduzca la cantidad de puntos dados : ');
fprintf('\n\n');
for i=0:(n-1),
   fprintf('- Introduzca X%1.0f ',i);
   X(i+1)=input    ('    =   ');
   if res==0
    fprintf('- Introduzca F(X%1.0f) ',i);
    FX(i+1)=input(' =   ');
 else
      FX(i+1)=funcion(X(i+1),fun);
   end
end

for i=1:n,
 Q(i,1)=FX(i);
end

for i=2:n,
   for j=i:n,
      Q(j,i)=(((Xi-X(j-i+1))*Q(j,i-1))-((Xi-X(j))*Q(j-1,i-1)))/(X(j)-X(j-i+1));
 end
end
fprintf('\n\n');
for i=2:n,
   for j=i:n,
      fprintf('- Q (%1.0f,%1.0f)  =  %3.8f\n ',j-1,i-1,Q(j,i));
      fprintf('\n');
   end
 
end