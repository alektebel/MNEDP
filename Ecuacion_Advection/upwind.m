
function [x, U] = upwind(dx, T)
    xmin = 0;
    xmax = 2;
    dt = dx;
    tmax = T;
    a= @(x, t) (1+x.^2)/(1+2*x.*t+2.*x.^2+x.^4);
    t_c=0;
    N = (xmax - xmin)/dx;
    nsteps = tmax/dt;
    x = xmin:dx:xmax;
    
    U0 = meseta(0.2, 0.4, x);
    U = U0;
    J= length(x);
    UP = U0;
    for n = 1:nsteps
        for i=2:J
            if a(x(i), t_c) > 0
                UP(i) = U(i) - a(x(i), t_c)*dt/dx*(U(i)-U(i-1));
            end
            if a(x(i), t_c) < 0
                UP(i) = U(i) - a(x(i), t_c)*dt/dx*(U(i+1)-U(i));
            end
        end
        U = UP;
        t_c = t_c+dt;
    end   
end
