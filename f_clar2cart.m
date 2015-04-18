function [ x,y ] = f_clar2cart( theta,beta )
% [ x,y ] = f_clar2cart( theta,beta )
% Funci�n que convierte un polo en notaci�n de Clar a sus coordenadas
% cartesianas para representar en estereogr�ficas
% los �ngulos se meten en grados, pero se calculan en radianes
theta = 2*pi- (theta .* pi /180)+pi/2;
beta = beta .* pi ./ 180;
r = sin(beta)./(1+cos(beta));
alpha = pi+theta;
x = r.*cos(alpha);
y = r.*sin(alpha);
end

