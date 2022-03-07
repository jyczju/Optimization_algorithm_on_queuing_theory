function [x,fval,status] = intprog(f,x_org,A,b,I,Aeq,beq,lb,ub,e)
%非线性整数规划求解函数
%其中f为目标函数
%A和b为不等式约束，Aeq与beq为等式约束
%I为整数约束的变量标号向量
%lb与ub分别为变量下界与上界
%x为最优解，fval为最优值
options = optimset('display','off');
[x0,fval0,exitflag] = fmincon(f,x_org,A,b,Aeq,beq,lb,ub,[],options);
if exitflag < 0
    disp('没有合适整数解');
    x = x0;
    fval = fval0;
    status = exitflag;
    return;
else
    %采用分支定界法求解
    bound = target([1 2 1 1 2 2 1 1]);
    [x,fval,status] = branchbound(f,x_org,A,b,I,x0,fval0,bound,Aeq,beq,lb,ub,e);
end