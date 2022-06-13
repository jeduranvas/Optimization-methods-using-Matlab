% %-------------------------------Punto 6----------------------------------------------%

% %----------------------Método de Newton----------------------------------------------%

    % clc
    % clear all
    % syms x1 x2
    % f=(x1-4)^4+(x1-4*x2)^2;
    % n=6;
    % fun_hes= hessian(f);
    % fun_gradient= gradient(f);
    % x1(1,1)=0;
    % x2(1,1)=0;
    % xk=[0,0];
    % sol(1,1)= eval(f);
    % plot(x1,x2,'o')
    % hold on
    %     for k=1:1:n
    %         hess=[eval(fun_hes)];
    %         gra=[eval(fun_gradient)];
    %         x= xk'-(inv(hess))*(gra);
    %         xk(1,1)=x(1,1);
    %         xk(1,2)=x(2,1);
    %         x1=xk(1,1);
    %         x2=xk(1,2);
    %         plot(x1,x2,'o')
    %         hold on
    %         xk
    %     sol(k+1,1)= eval(f);
    %     end
    % sol=vpa(sol,4)
    % 
    % % curvas de nivel sin restricciones
    %     [x,y]= meshgrid(-5:0.1:10);
    %     z=((x-4).^4)+((x-(y.*4)).^2);
    %     contour(x,y,z,25)
    %     hold on
    %     title('Curvas de Nivel de la función de costo','fontsize',12)
    %     xlabel('eje x'), ylabel('eje y'),zlabel('eje z');
    
% %----------------------Método de Levenberg-Marquardt----------------------------------------------%

%     clc
%     clear all
%     syms x1 x2
%     f=(x1-4)^4+(x1-4*x2)^2;
%     n=6;
%     fun_hes= hessian(f);
%     fun_gradient= gradient(f);
%     alpha=1.1;
%     I=eye(2);
%     x1(1,1)=0;
%     x2(1,1)=0;
%     xk=[0,0];
%     sol(1,1)= eval(f);
%     plot(x1,x2,'o')
%     hold on
%         for k=1:1:n
%             hess=(alpha*I)+[eval(fun_hes)];
%             gra=[eval(fun_gradient)];
%             x= xk'-(inv(hess))*(gra);
%             xk(1,1)=x(1,1);
%             xk(1,2)=x(2,1);
%             x1=xk(1,1);
%             x2=xk(1,2);
%             plot(x1,x2,'o')
%             hold on
%             xk
%         sol(k+1,1)= eval(f);
%         end
%     sol=vpa(sol,4)
%     
%     curvas de nivel sin restricciones
%         [x,y]= meshgrid(-5:0.1:10);
%         z=((x-4).^4)+((x-(y.*4)).^2);
%         contour(x,y,z,50)
%         hold on
%         title('Curvas de Nivel de la función de costo','fontsize',12)
%         xlabel('eje x'), ylabel('eje y'),zlabel('eje z');
%     
% %----------------------Método de Broyden-Fletcher-Goldfarb-Shanno----------------------------------------------%

%     clc
%     clear all
%     syms x1 x2
%     f=(x1-4)^4+(x1-4*x2)^2;
%     n=40;
%     fun_hes= hessian(f);
%     fun_gradient= gradient(f);
%     Vec_gra=[];
% %     alpha=1.1;
% %     I=eye(2);
%     x1(1,1)=0;
%     x2(1,1)=0;
%     xk=[0,0];
%     sol(1,1)= eval(f)
%     plot(x1,x2,'o')
%     hold on
%     hess=[]
%         for k=1:1:n
%                 if k==1
%                     sk(k,:)=[0,0]
%                     hess=eye(2)
%                     gra=[eval(fun_gradient)]'
%                     Vec_gra(k,1)=gra(1,1)%vector de gradientes
%                     Vec_gra(k,2)=gra(1,2)%vector de gradientes
%                     qk=[Vec_gra(k,:)]
%                 else
%                     sk(k,:)=([xk(k,1),xk(k,2)])-([xk(k-1,1),xk(k-1,2)])
%                     gra=[eval(fun_gradient)]'
%                     Vec_gra(k,1)=gra(1,1)%vector de gradientes
%                     Vec_gra(k,2)=gra(1,2)%vector de gradientes
%                     qk=[Vec_gra(k,:)]-[Vec_gra(k-1,:)]
%                     hess
%                     c1=qk'*qk
%                     c2=qk*sk(k,:)'
%                     c3=[hess]*sk(k,:)'*sk(k,:)*[hess']
%                     c4=(sk(k,:)*[hess]*sk(k,:)')
%                     hess=[hess]+((c1)/(c2))-(([hess]*sk(k,:)'*sk(k,:)*[hess'])/(sk(k,:)*[hess]*sk(k,:)'))
%                     end
%       
% %             gra=[eval(fun_gradient)]';
% %             Vec_gra(k,1)=gra(1,1);%vector de gradientes
% %             Vec_gra(k,2)=gra(1,2);%vector de gradientes
%             x= ([xk(k,1),xk(k,2)])'-((inv(hess))*([Vec_gra(k,:)']))
%             xk(k+1,1)=x(1,1)
%             xk(k+1,2)=x(2,1)
%             x1=xk(k+1,1)
%             x2=xk(k+1,2)
% %             plot(x1,x2,'o')
%             hold on
%             xk
%         sol(k+1,1)= eval(f)
%         end
%        Vec_gra 
%     sol=vpa(sol,4)
%     
%     % curvas de nivel sin restricciones
% %         [x,y]= meshgrid(0:0.1:10);
% %         z=((x-4).^4)+((x-(y.*4)).^2);
% %         contour(x,y,z,50)
% %         hold on
%          
%         xx1=-2:0.1:10;
%         xx2=-2:0.1:10;
%         [x1 x2]=meshgrid(xx1,xx2);
%         Fun=((x1-4).^4)+(x1-4*x2).^2;
%         contour(xx1,xx2,Fun,25)
%         title('Curvas de Nivel de la función de costo','fontsize',12)
%         xlabel('eje x'), ylabel('eje y'),zlabel('eje z');
%         for n=1:n-3
%             hold on
%             plot(xk(n+2,1),xk(n+2,2),'o')
%             pause(1)
%         end 

% %----------------------Método de Davion-Fletcher-Powell----------------------------------------------%        
    clc
    clear all
    syms x1 x2
    f=(x1-4)^4+(x1-4*x2)^2;
    n=40;
    fun_hes= hessian(f);
    fun_gradient= gradient(f);
    Vec_gra=[];
    alpha=1.1;
    I=eye(2);
    x1(1,1)=0;
    x2(1,1)=0;
    xk=[0,0];
    sol(1,1)= eval(f)
    plot(x1,x2,'o')
    hold on
    dk=[]
        for k=1:1:n
                if k==1
                    sk(k,:)=[0,0]
                    dk=eye(2)
                    gra=[eval(fun_gradient)]'
                    Vec_gra(k,1)=gra(1,1)%vector de gradientes
                    Vec_gra(k,2)=gra(1,2)%vector de gradientes
                    qk=[Vec_gra(k,:)]
                else
                    sk(k,:)=([xk(k,1),xk(k,2)])-([xk(k-1,1),xk(k-1,2)])
                    gra=[eval(fun_gradient)]'
                    Vec_gra(k,1)=gra(1,1)%vector de gradientes
                    Vec_gra(k,2)=gra(1,2)%vector de gradientes
                    qk=[Vec_gra(k,:)]-[Vec_gra(k-1,:)]
                    dk
                    c1=sk(k,:)'*sk(k,:);
                    c2=qk*sk(k,:)';
                    c3=[dk]*qk'*qk*[dk'];
                    c4=(qk*[dk]*qk');
                    dk=[dk]+((c1)/(c2))-(([dk]*qk'*qk*[dk'])/((qk*[dk]*qk')));
                    end
      
                        gra=[eval(fun_gradient)]';
            Vec_gra(k,1)=gra(1,1);%vector de gradientes
            Vec_gra(k,2)=gra(1,2);%vector de gradientes
            x= ([xk(k,1),xk(k,2)])'-(dk*([Vec_gra(k,:)']));
            xk(k+1,1)=x(1,1);
            xk(k+1,2)=x(2,1);
            x1=xk(k+1,1);
            x2=xk(k+1,2);
            xk
        sol(k+1,1)= eval(f)
        end
       Vec_gra 
    sol=vpa(sol,4)
    
    %curvas de nivel sin restricciones
                
        xx1=-2:0.1:10;
        xx2=-2:0.1:10;
        [x1 x2]=meshgrid(xx1,xx2);
        Fun=((x1-4).^4)+(x1-4*x2).^2;
        contour(xx1,xx2,Fun,15)
        title('Curvas de Nivel de la función de costo','fontsize',12)
        xlabel('eje x'), ylabel('eje y'),zlabel('eje z');
        for n=1:n-2
            hold on
            plot(xk(n+2,1),xk(n+2,2),'o')
            pause(0.2)
        end       
        
        
        