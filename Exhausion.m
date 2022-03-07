function [x0,p0]=Exhausion(x0,c) 
%穷举法求解函数
[p0,~] = tar_con(x0,c);
for i1=1:5
    for i2=1:5
        for i3=1:5
            for i4=1:5
                for i5=1:5
                    for i6=0:5
                        for i7=0:5
                            for i8=1:5
                                x=[i1 i2 i3 i4 i5 i6 i7 i8];
                                [f,g] = tar_con(x,c);
                                if sum(g<=0)==2
                                    if p0>=f
                                        x0=x;p0=f;
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end