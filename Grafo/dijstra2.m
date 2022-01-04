clc
clear

format short

matriz=[0 10 2 0 30;0 0 7 0 2;0 0 0 3 42;0 1 0 0 9;0 0 0 0 0]
fprintf('V={');
or=1;

for i=1:length(matriz)
   fprintf('%1.0f,',i);
    
end
 fprintf('}\n');
 
 fprintf('A={');
 for i=1:length(matriz)
    for j=1:length(matriz)
        if (matriz(i,j)~=0)
            fprintf('(%1.0f,%1.0f)',i,j);
        end
    end
     
 end
 
  fprintf('}\n');
  %rutas=zeros(6);
  rutas=[];    %creacion de un arraylist
  i=1;
  for j=1:length(matriz)
    
     if (matriz(or,j)~=0)
      
        % append(rutas,1, j);
       % rutas.add((0+1)+''+(j+1));
       rutas(i)=[j];
       vo(i)=or;
       vd(i)=j;
     end
     i=i+1;
         
  end
  i=1;
  for j=1:length(rutas)
    if(rutas(i)==0 && vo(i)==0 && vd(i)==0)
    rutas(i)=[];
    vo(i)=[];
    vd(i)=[];
  endif
if(i+1<=length(vo))
  i=i+1;
else
  break;
  endif
  endfor
  
final=[vo;vd];
final
 