
%% a b c d e f g h i j 
G=[0 1 0 0 1 0 0 0 1 1;   % a
   1 0 1 0 0 0 0 1 1 0;   % b
   0 1 0 1 0 0 1 1 0 0;   % c
   0 0 1 0 1 1 1 0 0 0;   % d
   1 0 0 1 0 1 0 0 0 1;   % e
   0 0 0 1 1 0 1 0 0 1;   % f
   0 0 1 1 0 1 0 1 0 0;   % g
   0 1 1 0 0 0 1 0 1 0;   % h
   1 1 0 0 0 0 0 1 0 1;   % i
   1 0 0 0 1 1 0 0 1 0];  % j   
V=[   1 -4 -4;   %a
      2  4 -4;   %b
      3  5  2;   %c
      4  0  4;   %d
      5 -5  2;   %e
      6 -1  2;   %f
      7  1  2;   %g
      8  2  0;   %h
      9  0 -4/3; %i
      10 -2  0]; %j

figure(100);
plot(V(:,2),V(:,3),'*b');  % vertices del grafo
hold on
orden=[];                          
for i=1:1:size(G,1)
   orden(1,i)=sum(G(i,:)); 
end

Y=[];
G=triu(G); % se obtiene la diagonal superior
for i=1:1:size(G,1)   % recorre todo el grafo para generar los caminos
    for j=1:1:size(G,1)
        
        if G(i,j)==1
          Y=[V(i,2:3);
             V(j,2:3)];
         
          plot(Y(:,1),Y(:,2),'-r')
          hold on
        end
    end    
end

%% verificación del teorema de euler
a=0;


%% Escojer un vertice aleatorio
A=G;
D=[];
n=0;
if a==0 || a==2

   for i=1:1:size(G,1)   % recorre todo el grafo para generar los caminos
    for j=1:1:size(G,1)
        
        if G(i,j)==1
            n=n+1;
            D(n,:)=[i j];  
        end
    end    
   end 
end
w=0; % contador de trayectorias
X=zeros(size(D,1)+1); % matriz para guardar las trayectorias 

F=[];   % vector que guarda el recorrido realizado
gu=D;
while D~=0 

   o=randi(size(D,1),1); % escoje un punto aleatorio para iniciar el recorrido
   
   F=D(o,:);   % se guarda en el vector solucion el primer paso 
    
   D(o,:)=[];  % se elimina la trayectoria de las trayectorias disponibles 
while F(1,1)~=F(1,end)
    
   a=D==F(1,end); % se busca las posibles trayectorias que tocan el punto final guardado en F
   a=a(:,1)+a(:,2); % se suman las columnas para detectar las trayectorias posibles 
   a=logical(a); % se guardan las trayectorias posibles 
   M=D(a,:);  % las trayectorias posibles se almacenan en una matriz M 
    
    if M==0 
      if size(F,2)==2
       F=[F(1,2) F(1,1)]; 
       a=D==F(1,end); % se busca las posibles trayectorias que tocan el punto final guardado en F
       a=a(:,1)+a(:,2); % se suman las columnas para detectar las trayectorias posibles 
       a=logical(a); % se guardan las trayectorias posibles 
       M=D(a,:);
       
      end
    end
  if M~=0   % si M es diferente de cero 
    r=randi(size(M,1),1);  % se escoje una trayectoria aleatoria 
   
        if F(1,end)==M(r,1)  % se agrega el paso al vector F
             F(1,end+1)=M(r,2);  %
        else
             F(1,end+1)=M(r,1);
        end
   
  if F(1,1)~=F(1,end)  % si no se ha cerrado una trayectoria 
  %% algoritmo para eliminar la trayectoria usada de la lista de trayectorias posibles      
     
    k=0;
    for i=1:1:size(D,1)  % se recorre toda la matriz de trayectorias disponibles
       
        if a(i,1)==1  % si se encuentra una trayectoria que sirve en el paso (la cual permita avanzar)
          k=k+1;  % se incrementa el contador de trayectorias disponibles
            if r==k   % si se encuentra exactamente en la trayectoria usada 
                D(i,:)=[];  % elimina la trayectoria de la lista de trayectorias a usar
                break   % termina el bucle for 
            end
        end
    end
    
         
  else  % entonces F(1,1)== F(1,end)
%% algoritmo para eliminar la trayectoria usada de la lista de trayectorias posibles      
     
    k=0;
    for i=1:1:size(D,1)  % se recorre toda la matriz de trayectorias disponibles
       
        if a(i,1)==1  % si se encuentra una trayectoria que sirve en el paso (la cual permita avanzar)
          k=k+1;  % se incrementa el contador de trayectorias disponibles
            if r==k   % si se encuentra exactamente en la trayectoria usada 
                D(i,:)=[];  % elimina la trayectoria de la lista de trayectorias a usar
                break   % termina el bucle for 
            end
        end
    end
    
%       msgbox('se ha cerrado una trayectoria')
      w=w+1;
      gu=D;  % si se encuentra un circuito entonces guardar los lazos restantes
      X(w,1:size(F,2))=F;
      

      
  end 
    
  else    % si M == 0 entonces no hay una trayectoria posible para pasar entonces el proceso termina 
      if F(1,1)~=F(1,end) % si la trayectoria no cerro en el mismo punto el proceso falla  
      msgbox('el proceso falló')
      msgbox('se encontro un circuito pero no es euleriano o la trayectoria no tiene salida')
      D=gu; % si no se encuentra circuito regresar a los lazos principales
      break
      break
      else   % si  F(1,1)==F(1,end)
       w=w+1;  % si al acbarcen las trayectorias se encuentra una trayectoria cerrada
      msgbox('se encontro una trayectoria euleriano')  
      gu=D;  % si se encuentra un circuito entonces guardar los lazos restantes
       X(w,1:size(F,2))=F;
      end 
  end
end
   if F(1,1)~=F(1,end) % si la trayectoria no cerro en el mismo punto el proceso falla  
      
      break
   end

end

%% graficos de las trayectorias cerradas encontradas 
for i=1:1:w   
    a=X(i,:)>0; % revisa las trayectorias diferentes de cero  
    F=X(i,a); % extrae la trayectoria en el vector F
    
   for n=1:1:size(F,2)-1   % genera las trayectorias cerradas encontradas en el grafo
      
          Y=[V(F(1,n),2:3);
             V(F(1,n+1),2:3)];
          figure(i)
          plot(Y(:,1),Y(:,2),'-b')
          hold on
         
   end 
    plot(V(:,2),V(:,3),'*r')  % vertices del grafo
    hold on
end

%% unir las trayectorias cerradas

i=0;
j=0;
while i<=w
    i=i+1;
    a=X(i,:)>0; % revisa las trayectorias diferentes de cero  
    T=X(i,a);  % extrae la trayectoria a usar en T
    j=0;
   while j<size(T,2)  % recorrer todas las casillas de T
      j=j+1 
     a=X(:,1)==X(i,j);  % se mira que valor de la primera columna tiene similitud con la fila recorrida 
     a(i,1)=0;    % colocar la primera columna de la fila en la que estamos parados en cero
     
     if sum(a)~=0   % si a es diferente de cero entonces hay una similitud
       b=X(a,:); % se extrae la trayectoria 
       d=b>0;  % se eliminan los ceros 
       B=b(d);  % se obtiene solo la trayectoria sin ceros 
       
       S1=T(1,1:j-1) % se divide el vector T 
       S2=T(1,j+1:end)
       F=[S1 B S2]  % se combinan las trayectorias
       
       X(i,1:size(F,2))=F;  % se coloca la nueva trayectoria en X
       X(a,:)=[];  % se elimina la trayectoria absorbida 
       i=1;
       a=X(i,:)>0; % revisa las trayectorias diferentes de cero del vector T  
       T=X(i,a);  % se extrae el nuevo vector T
     end       
   end
end


b=X(1,:); % se extrae la trayectoria 
d=b>0;  % se eliminan los ceros 
F=b(d)
if w~=1
for n=1:1:size(F,2)-1   % genera las trayectorias cerradas encontradas en el grafo
      
          Y=[V(F(1,n),2:3);
             V(F(1,n+1),2:3)];
          figure(1000+i)
          plot(Y(:,1),Y(:,2),'-b')
          hold on
         
end 
   plot(V(:,2),V(:,3),'*r')  % vertices del grafo
end



