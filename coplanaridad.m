function  [copla, score]  = coplanaridad( X,tolerancia )
% Funci�n de b�squeda de coplanaridad
% Adri�n Riquelme, marzo 2013
% Esta funci�n determina si los puntos de la nube introducida son
% coplanares. Si son perfectamente coplanares, los valores propios ser�n
% �nicamente 2. En el caso de que no sean coplanares, habr� un tercer valor
% propio, y su valor comparado con el los otros dos nos indicar� cuan
% coplanar cu�n coplanar deja de serlo.

[~, score, valor_propio] = princomp (X,'econ');
[n,~]=size(valor_propio);
if n==3
    %desviacion=((valor_propio(3,1)^2/norm(valor_propio,2)^2))^0.5;
    %l1=abs(valor_propio(1,1));
    %l2=abs(valor_propio(2,1));
    %l3=abs(valor_propio(3,1));
    desviacion=abs(valor_propio(3,1))/(abs(valor_propio(1,1))+abs(valor_propio(2,1))+abs(valor_propio(3,1)));
else
    desviacion=0;
end
if desviacion <= tolerancia
    copla = 1;
else
    copla = 0;
end
end
