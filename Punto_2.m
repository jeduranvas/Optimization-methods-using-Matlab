%-------------------------------Punto 2----------------------------------------------%
clc
clear all
c=[-15000 -17000];
A=[1     -1
   -1   1
   1    1];
b=[8 6 40];
lb= zeros(2,1);
ub=[]; 
% options= optimset('LargeScale','off');
options.Algorithm = 'simplex';
options.Display = 'iter'
x= linprog(c,A,b,[],[],lb,ub,[],options)
profit=-c*x

x= linspace(0,45,10000);
y=-8+x;
plot(x,y,'g')
hold on
y=6+x;
plot(x,y,'r')
hold on
y=40-x;
plot(x,y)
hold on
x=0;
plot(x,y)
hold on
y=0;
plot(x,y)
hold on
xlabel('eje x'), ylabel('eje y')