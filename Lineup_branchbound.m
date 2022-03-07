clear,clc;
%采用分枝定界法优化的主程序
format long;
c=[1 1 2 5 5 6 1 1];
fun=@(x) target(x);
A=[c(5) c(6) 0 0 0 0 0 0;
    0 0 c(1) c(3) c(4) c(5) c(6) c(8);];
b=[20-1,50-2];
lb0=[1,1,1,1,1,0,0,1];
ub0=[5,5,5,5,5,5,5,5];
tic
[x0,fval,~] = intprog(fun,[1 2 2 1 2 2 1 1],A,b,[1 2 3 4 5 6 7 8],[],[],lb0,ub0,1e-5);
Myprint(x0,c);
toc