function [ P ] = CreaCono( r, h, inc, error)
% Funci�n que genera las coordenadas de puntos en la superficie de un cono
% r: radio del cono
% h: altura del cono
% inc: separaci�n entre puntos
if r~=0 && h~=0 && inc~=0
    % creamos el primer punto, que ser� el centro de la base
    P=[0 0 0];
    nr = floor(r/inc)+1; %n�mero de puntos con los que incremento r
    nalfa = floor(2*pi*r / inc)+1; %n� puntos con los que incremento alfa
    dalfa = 2*pi/nalfa; %valor del diferencial de alfa
    for ii=1:nalfa
        alfa = ii*dalfa;
        for jj=1:nr
            radio = jj*r/nr;
            v = [radio * cos(alfa)+random('Normal',0,error/3,1), radio*sin(alfa)+random('Normal',0,error/3,1),+random('Normal',0,error/3,1)];
            P = [P ; v];
        end
    end
    % Creamos los anillos de la superficie lateral
    nh = floor(h/inc)+1;
    dh = h / nh;
    for ii=1:(nh-1)
        radio= r/h*(h-ii*dh);
        for jj=1:nalfa
            alfa = jj*dalfa;
            v = [radio * cos(alfa)+random('Normal',0,error/3,1), radio*sin(alfa)+random('Normal',0,error/3,1),ii*dh+random('Normal',0,error/3,1)];
            P = [P ; v];
        end
    end
    v = [0+random('Normal',0,error/3,1),0+random('Normal',0,error/3,1),h+random('Normal',0,error/3,1)];
    P = [P ; v];
        
else
    disp('Los datos de entrada son incorrectos. R, h e inc deben ser no nulos')
    P=[0 0 0];
end

% % guardamos en un archivo cono.txt
% fi = fopen('cono.txt', 'w') ;
% [n,p]=size(P);
% for k=1:n
%     fprintf(fi,  '%f %f	%f \n', P(k,1),P(k,2),P(k,3)); 
% end 
% fclose(fi);

% guardamos tambi�n en el fichero puntos.txt
fi = fopen('puntos.txt', 'w') ;
[n,p]=size(P);
for k=1:n
    fprintf(fi,  '%f %f	%f \n', P(k,1),P(k,2),P(k,3)); 
end 
fclose(fi);

end

