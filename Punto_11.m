clc
clear all
close all
syms x1 x2
f=-x1*x2;
x=[-0.1 -0.1]';
Ox=x1^2+x2^2-1;
    for i=1:5
         Ox1=x(1)^2+x(2)^2-1
            if Ox1<0
                Fi=-log(-Ox);
            else if Ox1>0
                Fi=7900;
                end 
            end 

        t=5+i;    
        F=t*f+Fi;
        Gra=gradient(F);
        Hess=hessian(F);
        Graeval=eval(Gra);
        Hesseval=eval(Hess);
        N=10;

        for k=(N*(i-1)+1):N*i
            x1=x(1,k);
            x2=x(2,k);  
            Graeval=[ - 2*x1^2*x2 - x2*(x1^2 + x2^2 - 1), - 2*x1*x2^2 - x1*(x1^2 + x2^2 - 1)];
            Hesseval=eval(Hess); 
            x(:,k+1)=x(:,k)-inv(Hesseval)*Graeval';     
            Feval(k,1)=eval(f);
        end
     end

%--------------------Gráficas------------------%
[x1,x2]=meshgrid(-20:.2:20, -20:.2:20);
    z1=(-1.*(x1).*(x2));
    surf(x1,x2,z1); colormap hsv;
hold on
grid
title('Gráfica función de costo','fontsize',12);
xlabel('eje x'), ylabel('eje y'),zlabel('eje z');

figure (2)
[xa1,xa2]=meshgrid(-2:0.01:2,-2:0.01:2);
f=-xa1.*xa2;
contour(xa1,xa2,f,100);
title('Curvas de Nivel de la función de costo','fontsize',12)
 xlabel('eje x1'), ylabel('eje x2');
%-------Restricciones
    x11=-1:0.02:1;
    x12=-1:0.02:1;
    R1=sqrt(1-x12.^2);
    R2=-sqrt(1-x12.^2);
     hold on
       plot(x11,R1,'r')
    hold on
    plot(x11,R2,'r')
% Soluciones encontradas
    for punto=1:N*i
       hold on
       plot(x(1,punto),x(2,punto),'o')
       pause(0.1)
    end