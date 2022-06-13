function [history,searchdir] = runfmincon
clear all
close all
clc
% Set up shared variables with OUTFUN
history.x = [];
history.fval = [];
searchdir = [];
 
% call optimization
A=[1 1];
b=[6];
x0=[0 0];
lb=[0 0];
options = optimoptions(@fmincon,'OutputFcn',@outfun,... 
    'Display','iter','Algorithm','sqp');
% options.Algorithm = 'sqp';
xsol = fmincon(@objfun,x0,A,b,[],[],lb,[],@confun,options);
 
 function stop = outfun(x,optimValues,state)
     stop = false;
 
     switch state
         case 'init'
             hold on
         case 'iter'
         % Concatenate current point and objective function
         % value with history. x must be a row vector.
           history.fval = [history.fval; optimValues.fval];
           history.x = [history.x; x];
         % Concatenate current search direction with 
         % searchdir.
           searchdir = [searchdir;... 
                        optimValues.searchdirection']
           plot(x(1),x(2),'o');
           hold on
         % Label points with iteration number and add title.
         % Add .15 to x(1) to separate label from plotted 'o'
           text(x(1)+.03,x(2),... 
                num2str(optimValues.iteration));
           title('Sequence of Points Computed by fmincon');
           xlabel('eje X1'), ylabel('eje X2');
         case 'done'
             hold off
         otherwise
     end
 end
 

 function f = objfun(x)
    f=((x(1)-(9/4))^2)+((x(2)-2)^2);
 end

        X=[
            0             0
        1.19223124	2.85812916
        1.55700484	2.29120431
        1.48571154	2.20225604
        1.49984864	2.24934609
        1.50000002	2.25000003
        1.50000001	2.25000003]

        Search_dir=[
        4.77	2.75
        0.3648	-0.5669
        -0.0713	-0.0889
        0.0141	0.0471
        0.0002	0.0007
        0	0]

        for k=1:1:6
            hold on    
            quiver(X(k,1),X(k,2),Search_dir(k,1),Search_dir(k,2))
        %     plot(xk(k,1),xk(k,2),'o')
            hold on
            pause(0.2)
        end






 function [c, ceq] = confun(x)
     % Nonlinear inequality constraints
     c = ((x(1))^2)-(x(2));
     % Nonlinear equality constraints
     ceq = [];
 end
end


