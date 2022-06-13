%-------------------------------Punto 5----------------------------------------------%
clc
clear all
syms x1 x2
f=-8*(x1)-16*(x2)+(x1^2)+4*(x2^2)
hes= hessian(f)
H=[2,0;0,8]
c=[-8 -16];
A=[1 1;1 0];
b=[5;3];
lb=[0,0]
options.Display = 'iter-detailed';
[x,fval,exitflag,output,lambda]=quadprog(H,c,A,b,[],[],lb,[],[],options)

%  % curvas de nivel sin restricciones
        [x1,x2]= meshgrid(-5:0.1:10);
        z=(-8.*(x1))-(16.*(x2))+(x1.^2)+4.*(x2.^2);     
        contour(x1,x2,z,25)
        hold on
        title('Curvas de Nivel de la función de costo','fontsize',12)
        xlabel('eje x'), ylabel('eje y'),zlabel('eje z');
        x1=5-x2;
        plot(x1,x2)
        hold on
        x2= linspace(-5,10,10000);
        x1 = 3;
        plot(x1,x2,'r')
        hold on
        plot(3,2,'o')
        hold on
        
%         
% Grafica de la función de costo

% [x1,x2]=meshgrid(0:.2:10, 0:.2:10);
% z1=(-8.*(x1))-(16.*(x2))+(x1.^2)+4.*(x2.^2);
% surf(x1,x2,z1); colormap hsv;
% hold on
% grid
% title('Gráfica función de costo','fontsize',12)
% xlabel('eje x'), ylabel('eje y'),zlabel('eje z');