function [u_estrella] = meseta(a, b, x);
    u_estrella=zeros(length(x), 1);
    for i  = 1:length(x)
        if x(i)>=a && x(i)<=b
            u_estrella(i)=1
        end
    end