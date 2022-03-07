function Myprint(x0,c)
%打印结果
x1=[0,0,0,0,x0(1),x0(2),1,0,x0(3),0,x0(4),x0(5),x0(6),x0(7),2,x0(8)];
[time,doc,vol,plost,~]=Lineup(x1(1:8),x1(9:end));
cost=200*doc+90*vol;
fprintf('逗留时间：%fh\n',time);
fprintf('人力成本：%fRMB\n',cost);
fprintf('损失率：%f%%\n',plost*100);
fprintf('共%d位医生、%d位志愿者\n',doc,vol);
fprintf('健康筛查：每个服务台安排%d位志愿者\n',x0(3));
fprintf('现场预约：每个服务台安排%d位志愿者\n',x0(4));
fprintf('填写材料：每个服务台安排%d位志愿者\n',x0(5));
fprintf('医生问询：每个服务台安排%d位医生及%d位志愿者\n',x0(1),x0(6));
fprintf('疫苗接种：每个服务台安排%d位医生及%d位志愿者\n',x0(2),x0(7));
fprintf('留观：安排1位医生及2位志愿者\n');
fprintf('出口核验：每个服务台安排%d位志愿者\n',x0(8));