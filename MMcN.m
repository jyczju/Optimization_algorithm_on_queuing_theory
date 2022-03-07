function [rho,Ls,Lq,Ws,Wq,Plost] = MMcN(lambda,mu,c,N)
%M/M/c/N/inf排队系统
%lambda为顾客平均达到率
%mu为系统平均服务率
%c为服务器台数
%N为系统中顾客总数的限制
%P0为系统空闲率
%系统中有n个顾客的概率为向量P的第n个分量
%Ls为系统中平均顾客数（平均队长）
%Lq为系统中平均等待接收服务的顾客数（平均等待队长）
%Ws为顾客在系统中的平均逗留时间
%Wq为顾客在系统中的平均等待时间
rho=lambda/(c*mu);
if(rho>1)
    %fprintf('rho>1 in MMcN\n');
    Lq=10000;
    Ls=Lq+lambda/mu;
    Wq=Lq/lambda;
    Ws=Ls/lambda;
    Plost=1;
    return
end
T1=0;
P=zeros(1,N);
if(rho==1)
    for k=0:c-1
        T1=T1+c^k/factorial(k);
    end
    T2=(c^c/factorial(c))*(N-c+1);
    P0=T1+T2;
else
    for k=0:c-1
        T1=T1+(c*rho)^k/factorial(k);
    end
    T2=(c^c/factorial(c))*(rho*(rho^c-rho^N)/(1-rho));
    P0=1/(T1+T2);
end
for i=1:c
    P(i)=((c*rho)^i/factorial(i))*P0;
end
for i=c:N
    P(i)=(c^c/factorial(c))*rho^i*P0;
end
Lq=((P0*rho*(c*rho)^c)/(factorial(c)*(1-rho)^2))*(1-rho^(N-c)-(N-c)*rho^(N-c)*(1-rho));
Ls=Lq+c*rho*(1-P(N));
Wq=Lq/(lambda*(1-P(N)));
Ws=Wq+1/mu;
Plost=c^c*rho^N*P0/factorial(c);
end