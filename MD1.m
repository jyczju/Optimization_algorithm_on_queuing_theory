function [rho,Ls,Lq,Ws,Wq] = MD1(lambda,mu)
%M/D/1/inf/inf排队系统
%lambda为顾客平均达到率
%mu为系统平均服务率
%Ls为系统中平均顾客数（平均队长）
%Lq为系统中平均等待接收服务的顾客数（平均等待队长）
%Ws为顾客在系统中的平均逗留时间
%Wq为顾客在系统中的平均等待时间
rho=lambda/mu;
if(rho>1)
    %fprintf('rho>1 in MD1\n');
    Lq=10000;
    Ls=Lq+lambda/mu;
    Wq=Lq/lambda;
    Ws=Ls/lambda;
    return
end
Lq=0.5*rho^2/(1-rho);
Ls=rho+Lq;
Wq=Lq/lambda;
Ws=Ls/lambda;