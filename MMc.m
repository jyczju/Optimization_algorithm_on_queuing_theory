function [rho,Ls,Lq,Ws,Wq] = MMc(lambda,mu,c)
%M/M/c/inf/inf排队系统
%lambda为顾客平均达到率
%mu为系统平均服务率
%c为服务器台数
%n_max为顾客人数的数值上限，一般取很大的数
%P0为系统空闲率
%系统中有n个顾客的概率为向量P的第n个分量
%Ls为系统中平均顾客数（平均队长）
%Lq为系统中平均等待接收服务的顾客数（平均等待队长）
%Ws为顾客在系统中的平均逗留时间
%Wq为顾客在系统中的平均等待时间
rho=lambda/(c*mu);
if(rho>1)
    %fprintf('rho>1 in MMc\n');
    Lq=10000;
    Ls=Lq+lambda/mu;
    Wq=Lq/lambda;
    Ws=Ls/lambda;
    return
end
T1=0;
for k=0:c-1
    T1=T1+(lambda/mu)^k/factorial(k);
end   %计算P0的第1项
T2=(lambda/mu)^c/(1-rho)/factorial(c);%计算P0的第2项
P0=1/(T1+T2);
Lq=((P0*rho*(c*rho)^c)/(factorial(c)*(1-rho)^2));
Ls=Lq+lambda/mu;
Wq=Lq/lambda;
Ws=Ls/lambda;