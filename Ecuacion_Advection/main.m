
T = [0.1, 0.5, 1];
dx=[0.02, 0.01];
a= @(x, t) (1+x^2)/(1+2*x*t+2*x^2+x^4);
exact  = @(x, t) x-t./(1+x.^2);
upwind_static = figure('Name','Método upwind');
Lax_wendrof_static = figure('Name','Método Lax-Wendroff');
figure(upwind_static);
tiledlayout(3, 2);
for i=1:3
    for j=1:2
        nexttile
        [x, U] = upwind(dx(j), T(i));
        plot(x, U, 'bX');
        hold on;
        plot(x, meseta(0.2,0.4, exact(x, T(i)))); 
        title('T = '+string(T(i))+'; dx = '+string(dx(j)));
        ylim([0, 1.3]); 
        xlim([0 1.5]);
        hold off;
    end
end
figure(Lax_wendrof_static);
tiledlayout(3, 2);
for i=1:3
    for j=1:2
        nexttile
        [x, U] = laxwendroff(dx(j), T(i));
        plot(x, U, 'bX');
        hold on;
        plot(x, meseta(0.2,0.4, exact(x, T(i)))); 
        title('T = '+string(T(i))+'; dx = '+string(dx(j)));
        ylim([0, 1.3]); 
        xlim([0 1.5]);
        hold off;
    end
end
