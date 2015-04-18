function [ wplane ] = f_wpole2wplane( wpole )
% wpole2wplane, Adri�n Riquelme, abril 2013
% funci�n que toma el omega de un polo y lo convierte en en el omega del
% plano
% Importante: los �ngulos son en radianes!!

wplane=zeros(size(wpole));
I=find(wpole>=0 & wpole<pi); wplane(I)=wpole(I)+pi;
I=find(wpole>=pi & wpole<2*pi); wplane(I)=wpole(I)-pi;
% if wpole>=0 && wpole<pi
%     wplane=wpole+pi;
% else
%     wplane=wpole-pi;
% end
end