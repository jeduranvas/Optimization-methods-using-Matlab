% %-------------------------------Punto 7----------------------------------------------%
clc
clear all
A=[1 -1 1;1 1 0]
[U,S,V]= svd(A)
b=[1;2];
G=V';
si=[S(:,1),S(:,2)];
 %combinación de columnas posible para encontrar V1 y V2
% Vp1=[V(1,:),V(3,:)]
% Vp2=[V(2,:)]
% Vp1'*Vp2
% Vp1=[V(2,:),V(3,:)]
% Vp2=[V(1,:)]
% Vp1'*Vp2
Vp1=[G(1,:)',G(2,:)'];
Vp2=[G(3,:)'];
Vp1'*Vp2;
A=Vp2;
x0=Vp1*inv(si)*U'*b
syms xeq
x1=x0(1,1)+(A(1,1)*xeq);
x2=x0(2,1)+(A(2,1)*xeq);
x3=x0(3,1)+(A(3,1)*xeq);
vpa(x1,4)
vpa(x2,4)
vpa(x3,4)
f=(x1^2)+8*(x2^2)+(3*(x1)*(x3));
vpa(f,4)
fun_gradient= gradient(f); %Gradiente
xeq=-6.1;
eval(x1)
eval(x2)
eval(x3)
eval(f)
