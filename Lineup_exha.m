clear,clc;
%采用穷举法优化的主程序
format long;
c=[1 1 2 5 5 6 1 1];
x0=[1 2 2 1 2 2 1 1];
tic
[x0,~]=Exhausion(x0,c);
Myprint(x0,c);
toc