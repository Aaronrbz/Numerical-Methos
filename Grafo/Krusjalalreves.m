clear all
clc
NumA=16;%input('Ingresa el numero de aristas: ');
n=10;%input('Ingresa el nuemero de vertices: ');
%for j=1:NumA
%    Matriz(1,j)=input('Ingresa el vertise1: ');
%    Matriz(2,j)=input('Ingresa el vertise2: ');
%    Matriz(3,j)=input('Ingresa el peso de la arista: ');
%end
%disp(Matriz);
Matriz=[1 1 1 2 2 3 3 4 4 5 6 6 7 7 8 9;2 3 4 4 5 4 6 5 7 8 7 9 8 9 10 10;2 1 1 3 3 1 4 6 7 4 2 5 5 10 5 4];
%Matriz=[0 6 1 5 0 0; 6 0 5 0 3 0; 1 5 0 5 6 4; 5 0 5 0 0 2; 0 3 6 0 0 6 ; 0 0 4 2 6 0];
for i=1:NumA
    for j=2:NumA
        if Matriz(3,j)>Matriz(3,j-1) %la cosa para cambiar el peso del ornenamiento
            Ax=Matriz(1,j-1);
            Ax2=Matriz(2,j-1);
            Ax3=Matriz(3,j-1);
            Matriz(1,j-1)=Matriz(1,j);
            Matriz(2,j-1)=Matriz(2,j);
            Matriz(3,j-1)=Matriz(3,j);
            Matriz(1,j)=Ax;
            Matriz(2,j)=Ax2;
            Matriz(3,j)=Ax3;
        end
    end
end
disp(Matriz);
Aya=zeros(n);
for i=1:NumA
    Aya(Matriz(1,i),Matriz(2,i))=1;
end
disp(Aya);
K=1;
J=1;
TAya=zeros(n);
T=[];
TAya(Matriz(1,1),Matriz(2,1))=1;
TAya(Matriz(2,1),Matriz(1,1))=1;
T=[T Matriz(:,1)];
while (K<n-1)
    J=J+1;
    caminos=zeros(n);
    for i=1:K
        caminos=caminos+(TAya^i);
    end
    TAya
    caminos
    %[Matriz(1,J),Matriz(2,J)]
    if caminos(Matriz(1,J),Matriz(2,J))==0
        TAya(Matriz(1,J),Matriz(2,J))=1;
        TAya(Matriz(2,J),Matriz(1,J))=1;
        T=[T Matriz(:,J)];
        K=K+1;
    end
end
disp(T);
for i=1:length(T)
  Aris(i)=T(3,i);
endfor

disp("El peso es: ")
disp(sum(Aris));