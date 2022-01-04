clc
clear

aris=input("Dime cuantas aristas hay\n");
for i=1:aris
  for j=1:3
    if(j==1)
    a(i,j)=input("dame x")
  endif
  if(j==2)
    a(i,j)=input("dame y")
  endif
  if(j==3)
    a(i,j)=input("dame el peso")
  endif
  a=a';
    endfor
  endfor
  disp(a);

%V=[1,2,0];
 %   ban = false;
  %while ban != true
   % ban = true;
   % n=length(V);
    %for i=n:n-1
     %     if (V(i) > V(i+1))
      %      aux = V(i+1);
       %     V(i+1) = V(i);
        %    V(i) = aux;
         %   ban = false;
            
        %  endif
      
    %endfor
  %endwhile  
  