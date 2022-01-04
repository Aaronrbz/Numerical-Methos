clc
clear
P0=input('Ingrese la aproximacion P0: ');
P1=input('Ingrese la aproximacion P1: ');
P2=input('Ingrese la aproximacion P2: ');
Tol=input('Ingrese la toleracina Tol: ');
No=input('Ingrese el numero maximo de interaciones No: ');
fun=input('Introduzcal a funcion f(x)=','s');
f=inline(fun);
H1=P1-P0;
H2=P2-P1;
s1=(f(P1)-f(P0))/H1;
s2=(f(P2)-f(P1))/H2;
d=(s2-s1)/(H2-H1);
i=3;
while(i<No)
    b=s2+(H2*d);
    D=((b^2)-4*f(P2)*d)^(1/2);
    if abs(b-D)<abs(b+D)
        E=b+D;
    else
        E=b-D;
    end
    h=(-2*f(P2))/E;
    P=P2+h;
    if(abs(h)<Tol)
        fprintf("El procesos termino en %d iteraciones y el P= %f %f iz\n",i,real(P), imag(P));
        break;
    end
    P0=P1;
    P1=P2;
    P2=P;
    H1=P1-P0;
    H2=P2-P1;
    s1=(f(P1)-f(P0))/H1;
    s2=(f(P2)-f(P1))/H2;
    d=(s2-s1)/(H2-H1);
    i=i+1;
end
if i>=No
    fprintf("EL metodo fracaso despues de No: %d iteraciones\n",No);
end