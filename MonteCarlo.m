function [x0,p0]=MonteCarlo(x0,c)
%蒙特卡洛方法求解函数
rand('state',1000*sum(clock)*rand(1));
[p0,~] = tar_con(x0,c);
for i = 1:2.5e5  %根据蒙特卡洛方法，可以适当减小试探次数
    temp1=randi([1,5],6,1);
    temp2=randi([0,5],2,1);
    x=[temp1(1:5);temp2;temp1(end)];
    [f,g] = tar_con(x,c);
    if sum(g<=0)==2
        if p0 >= f
            x0 = x;
            p0 = f;
        end
    end
end
