function f = target(x)
%目标函数
x1=[0,0,0,0,x(1),x(2),1,0,x(3),0,x(4),x(5),x(6),x(7),2,x(8)];
[time,doc,vol,plost,~]=Lineup(x1(1:8),x1(9:end));
cost=200*doc+90*vol;
f = 100*time+0.01*cost+0.005*plost;%权重可调整，注意Prio之间本身的数量级差异