function [X, u] = sol_real (J,t)
    A_m = zeros(100, 1);
    for i=1:100
        A_m(i)=2.*integral(@(x) x.*(1-x).*sin(i*pi.*x), 0, 1);
    end
    X=linspace(1/J, 1-1/J, J-1);
    u=zeros(J-1,1);
    for j=1:J-1
        for k=1:100
            u(j) = u(j) + A_m(k)*exp(-((k*pi)^2)*t)*sin(k*pi.*X(j));
        end
    end







