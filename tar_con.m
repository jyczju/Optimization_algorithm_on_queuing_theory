function [f,g] = tar_con(x,c)
%目标函数与约束矩阵
f = target(x);
g = [c(5)*x(1)+c(6)*x(2)-19
    c(1)*x(3)+c(3)*x(4)+c(4)*x(5)+c(5)*x(6)+c(6)*x(7)+c(8)*x(8)-48];