function [time,doc,vol,plost,c]=Lineup(x,y)
%全流程排队模型
%x为医生安排人数
%y为志愿者安排人数
%time为总平均逗留时间
%doc为医生总人数
%vol为志愿者总人数
%plost为系统损失率
%c为各环节服务台数
N=50;%入口限制排队人数
lambda(1)=160;%入口平均到达率

c(1)=1;%健康筛查服务台数
c(2)=1;%网上预约服务台数
c(3)=2;%现场预约服务台数
c(4)=5;%填写材料服务台数
c(5)=5;%医生问询服务台数
c(6)=6;%疫苗接种服务台数
c(7)=1;%无实际意义，仅为了形式统一
c(8)=1;%出口核验服务台数

mu(1)=90*y(1);%健康筛查平均服务率
mu(3)=20*y(3);%现场预约平均服务率
mu(4)=24*y(4);%填写材料平均服务率
mu(5)=25*(0.7*x(5)+0.3*y(5));%医生问询平均服务率
mu(6)=20*(0.7*x(6)+0.3*y(6));%疫苗接种平均服务率
mu(8)=240*y(8);%出口核验平均服务率

[rho(1),Ls(1),Lq(1),Ws(1),Wq(1),plost] = MMcN(lambda(1),mu(1),c(1),N+1);%健康筛查
lambda(2)=0.8*min(lambda(1),c(1)*mu(1));%网上预约平均到达率
mu(2)=lambda(2);%网上预约平均服务率
rho(2)=1;Ls(2)=0;Lq(2)=0;Ws(2)=0;Wq(2)=0;%网上预约无需排队，直接进入下一阶段
lambda(3)=0.2*min(lambda(1),c(1)*mu(1));%现场预约平均到达率
[rho(3),Ls(3),Lq(3),Ws(3),Wq(3)] = MMc(lambda(3),mu(3),c(3));%现场预约
lambda(4)=lambda(2)+min(lambda(3),c(3)*mu(3));%填写材料平均到达率
[rho(4),Ls(4),Lq(4),Ws(4),Wq(4)] = MMc(lambda(4),mu(4),c(4));%填写材料
lambda(5)=min(lambda(4),c(4)*mu(4));%医生问询平均到达率
[rho(5),Ls(5),Lq(5),Ws(5),Wq(5)] = MMc(lambda(5),mu(5),c(5));%医生问询
lambda(6)=min(lambda(5),c(5)*mu(5));%疫苗接种平均到达率
[rho(6),Ls(6),Lq(6),Ws(6),Wq(6)] = MMc(lambda(6),mu(6),c(6));%疫苗接种
lambda(7)=min(lambda(6),c(6)*mu(6));%留观平均到达率
mu(7)=lambda(7);%留观平均离开率
rho(7)=1;Ws(7)=0.5;Wq(7)=0.5;
Ls(7)=lambda(7)*Ws(7);Lq(7)=lambda(7)*Wq(7);%留观无需排队，半小时后即可离开
lambda(8)=lambda(7);%出口核验平均到达率
[rho(8),Ls(8),Lq(8),Ws(8),Wq(8)] = MD1(lambda(8),mu(8));%出口核验
time=sum(Ws);
doc=sum(c.*x);
vol=sum(c.*y);