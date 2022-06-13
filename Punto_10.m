%-------------------------------Punto 10----------------------------------------------%
clear all
clc
syms x1 x2
A=[300 0;0 300]
fb=4*((x1-10)^2)+((x2-4)^2);
g1=x1-10-x2
g2=-x1+3+x2
g3=-x1
n=18; %Número de iteraciones
nd=2; %Dimensiones
fun_gradient= gradient(fb);
fun_gradient_g1= gradient(g1)
fun_gradient_g2= gradient(g2)
fun_gradient_g3= gradient(g3)
gradiente_G=[fun_gradient_g1';fun_gradient_g2';fun_gradient_g3,0]
x1(1,1)=0;
x2(1,1)=0;
xk=[0,0];
sol(1,1)= eval(fb);

    for k=1:1:n
        ge1=eval(g1);
        ge2=eval(g2);
        ge3=eval(g3);
        if [ge1,ge2,ge3]<=0
            gra=[eval(fun_gradient)]
            x= xk(k,:)'-((1)/(nd+1))*((A*gra)/((gra'*A*gra)^(1/2)));
            xk(k+1,1)=x(1,1);
            xk(k+1,2)=x(2,1);
            x1=xk(k+1,1);
            x2=xk(k+1,2);
            A=((nd^2)/(nd^2-1))*(A-(((2)/(nd+1))*((A*gra*gra'*A')/(gra'*A*gra))));
        else 
            gra=[eval(gradiente_G)];
            [valor pos]=max([ge1,ge2,ge3]);
            x= xk(k,:)'-((1)/(nd+1))*((A*gra(pos,:)')/((gra(pos,:)*A*gra(pos,:)')^(1/2)));
            xk(k+1,1)=x(1,1);
            xk(k+1,2)=x(2,1);
            x1=xk(k+1,1);
            x2=xk(k+1,2);
            A=((nd^2)/(nd^2-1))*(A-(((2)/(nd+1))*((A*gra(pos,:)'*gra(pos,:)*A')/(gra(pos,:)*A*gra(pos,:)'))));
        end
                xk
                sol(k+1,1)= vpa(eval(fb),4)
    end
    
%%%%--------Grafica de la solución--------%%%%%
[x1,x2]= meshgrid(-10:0.1:30);
x=[x1;x2];
% f=(0.01*(x1.^2))+(0.01*(x2.^2));
fc=4*((x1-10).^2)+((x2-4).^2);
fb=4*((x1-10)^2)+((x2-4)^2);
% z= vpa(f)
% figure(1)
% contour(x1,x2,f,25);
hold on
contour(x1,x2,fc,25);
hold on
x2=-20:.2:40;
x1=10+x2;
plot(x1,x2,'r')
hold on
x1=3+x2;
plot(x1,x2)
x1=0;
hold on
% plot(fb)  
 title('Curvas de Nivel de la función de costo','fontsize',12)
 xlabel('eje x1'), ylabel('eje x2');
for k=1:1:n
    
    plot(xk(k,1),xk(k,2),'o')
    hold on
    pause(0.2)
end
    