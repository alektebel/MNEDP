function [x, U] = laxwendroff(dx, T)
    xmin = 0;
    xmax = 2;
    dt = dx;
    t=0;
    tmax = T;
    a= @(x, t) (1+x.^2)/(1+2*x.*t+2*x.^2+x.^4);
    at = @(x, t) -2*x*(1+x^2)/(1+2*x*t+2*x^2+x^4)^2;
    N = (xmax - xmin)/dx;
    nsteps = tmax/dt;
    x = xmin:dx:xmax;
    U0 = meseta(0.2, 0.4, x);
    U = U0;
    UP = U0;
    for n = 1:nsteps
        for i=2:length(x)-1
            delta_ox = (U(i+1)-U(i-1))/2;
            sigma_x = a(x(i)+dx/2, t)*U(i+1)-U(i)*(a(x(i)-dx/2, t)+a(x(i)+dx/2, t))+U(i-1)*a(x(i)-dx/2, t);
            UP(i) = U(i) - a(x(i), t)*delta_ox + (dt^2)/2*(-at(x(i), t)*delta_ox/dx + a(x(i), t)*sigma_x/dx^2);
        end
        t=t+dt;
        U=UP;
    end   
    
end

