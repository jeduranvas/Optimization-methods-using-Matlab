%-------------------------------Punto 3----------------------------------------------%
clc
clear all
H=[1 -4 2 1
    -4 16 -8 -4
    2 -8 4 2
    1 -4 2 1];
c=[ -1; 0; 7; 4];
Aeq=[ 1 1 1 1];
beq=4;

lb=[0,0,0,0];
ub=[]; 
options= optimset('LargeScale','off');
options.Display = 'iter-detailed';
[x,fval,exitflag,output,lambda]=quadprog(H,c,[],[],Aeq,beq,lb,ub,[],options)
sln=(0.5*x'*H*x)+(c'*x)

alp=[0.8]
u=[0;0;8.2;5]
Ckt1=H*x+Aeq'*alp-u
