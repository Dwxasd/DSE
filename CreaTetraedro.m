function [ P ] = CreaTetraedro( l, h,inc, error)
% Funci�n que genera las coordenadas de puntos en la superficie de un
% tetraedro
% l: lado de la base
% h: altura del hexaedro. 0 si es regular
% inc: separaci�n entre los puntos
% error: error gaussiano que le metemos a los puntos
%    Copyright (C) {2015}  {Adri�n Riquelme Guill, adririquelme@gmail.com}
%
%    This program is free software; you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation; either version 2 of the License, or
%    any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License along
%   with this program; if not, write to the Free Software Foundation, Inc.,
%   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
%    Discontinuity Set Extractor, Copyright (C) 2015 Adri�n Riquelme Guill
%    Discontinuity Set Extractor comes with ABSOLUTELY NO WARRANTY.
%    This is free software, and you are welcome to redistribute it
%    under certain conditions.

P=[0 0 0]; %se inicia el vector
if l==0
    P=[0] % el tetraedro es nulo y no se puede crear
else
    if h==0
        h = l*(6^0.5)/3; % el tetraedro ser� regular
    end
    % creamos el tetraedro
    t=0:(inc/h):1;
    % r=t/h*(l/(3^0.5));
    [x,y,z]=cylinder(t,3);
    [a,b]=size(x);
    for ii=1:b-1
        for jj=1:a
            zi=z(jj,ii)*h;
            xi=x(jj,ii)*(l/3^0.5);
            yi=y(jj,ii)*(l/3^0.5);
            zf=z(jj,ii+1)*h;
            xf=x(jj,ii+1)*(l/3^0.5);
            yf=y(jj,ii+1)*(l/3^0.5);
            d=((xi-xf)^2+(yi-yf)^2+(zi-zf)^2)^(0.5);
            if d==0
                v=[0 0 0];
            else
                if xi==xf && yi==yf && zi==zf
                    v=[xi yi zi];
                else
                    if d/inc - floor(d/inc)==0
                        inci=floor(d/inc);
                    else
                        inci=floor(d/inc)+1;
                    end
                    xn=[xi:(xf-xi)/inci:xf]+random('Normal',0,error/3,1);
                    yn=[yi:(yf-yi)/inci:yf]+random('Normal',0,error/3,1);
                    if zi==zf
                        zn=[0];
                        for kk=1:(inci+1)
                            zn(1,kk)=zf+random('Normal',0,error/3,1);
                        end
                    else
                        zn=[zi:(zf-zi)/inci:zf]+random('Normal',0,error/3,1);
                    end
                    v=[xn;yn;zn]';
                end
            end
            P=[P;v];
        end
    end
%     % guardamos en un archivo tetraedro.txt
%     fi = fopen('tetraedro.txt', 'w') ;
%     [n,p]=size(P);
%     for k=1:n
%         fprintf(fi,  '%f %f	%f \n', P(k,1),P(k,2),P(k,3)); 
%     end 
%     fclose(fi);
    % guardamos en un archivo puntos.txt
      fi = fopen('puntos.txt', 'w') ;
    [n,p]=size(P);
    for k=1:n
        fprintf(fi,  '%f %f	%f \n', P(k,1),P(k,2),P(k,3)); 
    end 
    fclose(fi);
end

end
    

