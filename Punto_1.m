%-------------------------------Punto 1----------------------------------------------%
% %curvas de nivel sin restricciones
% [x,y]= meshgrid(0:.1:5);
% z= x-(2*y);
% [c,h]=contour(x,y,z,5);
% hold on
% clabel(c,h)
% title('Curvas de Nivel de la función de costo con restricciones','fontsize',12)
% xlabel('eje x'), ylabel('eje y'),zlabel('eje z');
% %-----------------------------------------------------------------------------%
% % Grafica de la función de costo
% 
% [x,y]=meshgrid(0:.2:5, 0:.2:5);
% z1= x -(2.*(y));
% surf(x,y,z1); colormap hsv;
% hold on
% grid
% title('Gráfica función de costo','fontsize',12)
% xlabel('eje x'), ylabel('eje y'),zlabel('eje z');
% 
% %-----------------------------------------------------------------------------%
% % Curvas de nivel con restricciones
% 
% x=0:.2:5;
% y3=0:.2:5
% y1=2-x
% plot(x,y1)
% hold on
% y2=1+x
% plot(x,y2)
% hold on
% x= linspace(0,5,10000);
% y3 = 3;
% plot(x,y3,'r')
% hold on
% y4=0
% plot(x,y4)
% hold on
% xlabel('eje x'), ylabel('eje y'),zlabel('eje z')

%--------%iteración 1---------------%
% N=[0    0
%    0    0
%    0    0
%    1    0
%    0    1]
% A=[-1    -1  1  0  0
%     1    -1  0  1  0
%     0     1  0  0  1
%     0    -1  0  0  0
%    -1     0  0  0  0]
% g=inv(A)
% b=[-2;-1;3;0;0]
% xb=g*b
% cb=[1,-2,0,0,0]
% cn=[0,0]
% z=cb*g*b
% p=cn-(cb*g*N)
% 
% N1=[0
%     0
%     0
%     1
%     0]
% y=g*N1
%-------------%iteración 2---------------%
clear all
N=[0    0
   0    0
   1    0
   0    0
   0    1]
A=[-1    -1  1  0  0
    1    -1  0  1  0
    0     1  0  0  0
    0    -1  0  0  1
   -1     0  0  0  0]
g=inv(A)
b=[-2;-1;3;0;0]
xb=g*b
cb=[1,-2,0,0,0]
cn=[0,0]
z=cb*g*b
p=cn-(cb*g*N)



