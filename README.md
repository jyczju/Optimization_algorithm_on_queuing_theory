### 关于排队论问题的优化算法

本项目是浙江大学控制学院《运筹学》课程大作业论文的相关代码，主要算法是基于非线性整数规划的分支定界法



##### 代码说明

a)   MMc.m：M/M/c/∞/∞排队系统，输入平均到达率、平均服务率及服务台的个数，可返回该排队环节的各项指标。

b)   MMcN.m：M/M/c/N/∞排队系统，输入平均到达率、平均服务率及服务台的个数，可返回该排队环节的各项指标。

c)   MD1.m：M/D/1/∞/∞排队系统，输入平均到达率、平均服务率及服务台的个数，可返回该排队环节的各项指标。

d)   Lineup.m：全流程排队模型，输入医生和志愿者的安排方案，可返回接种者的总平均逗留时间、医生总人数、志愿者总人数、系统损失率。

e)   Lineup_real.m：计算当下现实人员配置情况下的排队系统各项指标。

f)    target.m：目标函数。

g)   tar_con.m：输入向量                                ，返回目标函数及约束矩阵。

h)   Exhausion.m：利用穷举法求解非线性整数规划问题，返回最优解与最优值。

i)    Lineup_exha.m：利用穷举法求解优化问题的主程序，优化求解时只需运行该脚本即可。

j)    MonteCarlo.m：利用蒙特卡洛方法求解非线性整数规划问题，返回最优解与最优值。

k)   Lineup_monte.m：利用蒙特卡洛方法求解优化问题的主程序，优化求解时只需运行该脚本即可。

l)    branchbound.m：分枝定界法的递归函数。

m)  intprog.m：利用分枝定界法求解非线性整数规划问题，返回最优解、最优值及有无解的标志。

n)   Lineup_branchbound.m：利用分枝定界法求解优化问题的主程序，优化求解时只需运行该脚本即可。

o)   Myprint.m：用于输出的辅助函数。