Js=[10, 20, 40, 80];
%esquemas = [theta, mu, nu; ... ]
esquemas = [0, 1/2, 0;
            0, 1/6, 0;
            1/2, 1/2, 0;
            1/2, 0, 1/40;
            1, 5, 0;
            1, 0, 1/4];
[c, ~]=size(esquemas);
%inicializamos los errores y el tiempo en un array 4, c
errores = zeros(length(Js),c);
tiempos = zeros(length(Js),c);

for i=1:length(Js)
    for j=1:c
        %calculamos la aproximación con el programa escrito y la solución
        %real con 'sol_real'
        [~, U, tiempo] = tetha_metodo(esquemas(j,1), Js(i), 0.6, esquemas(j,2), esquemas(j,3));
        [~, u] = sol_real(Js(i), 0.6);
        %guardamos errores y tiempos
        errores(i,j) =max(abs(U-u))/max(u);
        tiempos(i,j) = tiempo;
    end 
end
%creamos los dibujos donde plasmaremos todo
CPU_vs_Error = figure('Name', 'CPU_vs_error');
errores_vs_J = figure('Name', 'errores vs J');


C=Js;
figure(errores_vs_J);
%primero dibujamos los puntos correspondientes a los errores en función de
%los valores que toma J
legend;
loglog(Js, errores(:,1),'Ob',Js, errores(:,2),'Xr',Js, errores(:,3),'+g', Js, errores(:,4), '*m', Js, errores(:,5), 'sy', Js, errores(:,6), 'dk');
hold on;
xlabel('J');
ylabel('Error');
title('Error vs J');
%dibujamos las rectas de regresión mediante la función 'exp_regression'
loglog(Js, exp_regression(Js, errores(:,1), C), 'b','HandleVisibility','off');
loglog(Js, exp_regression(Js, errores(:,2), C), 'r','HandleVisibility','off');
loglog(Js, exp_regression(Js, errores(:,3), C), 'g','HandleVisibility','off');
loglog(Js, exp_regression(Js, errores(:,4), C), 'm','HandleVisibility','off');
loglog(Js, exp_regression(Js, errores(:,5), C), 'y','HandleVisibility','off');
loglog(Js, exp_regression(Js, errores(:,6), C), 'k','HandleVisibility','off');
legend('\theta=0, \nu=1/2, p='+string(pendiente_exp(Js, errores(:,1))),'\theta=0, \nu =1/6, p='+ string(pendiente_exp(Js, errores(:,2))), '\theta =1/2, \nu =1/2, p='+string(pendiente_exp(Js, errores(:,3))), '\theta = 1/2, \mu = 1/40, p='+string(pendiente_exp(Js, errores(:,4))), '\theta =1, \nu =5, p='+string(pendiente_exp(Js, errores(:,5))), '\theta=1, \mu =1/4, p='+string(pendiente_exp(Js, errores(:,6))));
hold off;
%Repetimos el mismo proceso con los tiempos de ejecución de cada modelo.
figure(CPU_vs_Error);
loglog( tiempos(:,1),errores(:,1),'O-b', tiempos(:,2),errores(:,2),'X-r', tiempos(:,3),errores(:,3),'+-g',  tiempos(:,4),errores(:,4), '*-m',  tiempos(:,5),errores(:,5), 's-y',  tiempos(:,6),errores(:,6), 'd-k');
legend;
hold on;
xlabel('CPU time');
ylabel('Error');
title('Error vs CPU');
legend('\theta=0, \nu=1/2','\theta=0, \nu =1/6', '\theta =1/2, \nu =1/2', '\theta = 1/2, \mu = 1/40', '\theta =1, \nu =5', '\theta=1, \mu =1/4');
hold off;
