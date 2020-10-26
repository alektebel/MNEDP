function upwind_dinamic(dx, T)
    xmin = 0;
    xmax = 2;
    dt = dx;
    t=0;
    tmax = T;
    a= @(x, t) (1+x.^2)/(1+2*x.*t+2*x.^2+x.^4);
    N = (xmax - xmin)/dx;
    nsteps = tmax/dt;
    x = xmin-dx:dx:xmax+dx;
    U0 = meseta(0.2, 0.4, x);
    U = U0;
    UP = U0;
    for n = 1:nsteps
        U(1)=U(3);
        U(N+3)=U(N+1);
        for i=2:length(x)-1
            if a(x(i), t) < 0
                UP(i) = U(i) - a(x(i), t)*(U(i+1)-U(i));
            end
            if a(x(i), t) > 0
                UP(i) = U(i) -a(x(i), t)*(U(i)-U(i-1));
            end
        end
        t=t+dt;
        plot(x, U, 'bX');
        hold on;
        plot(x, meseta(exact(0.2, T(i)), exact(0.4, T(i)), x)); 
        title('T = '+string(t));
        ylim([0, 1.3]); 
        xlim([0 1.5]);
        hold off;
        shg
        pause(dt)
        U=UP;
    end   
    
end

