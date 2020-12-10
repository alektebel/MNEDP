N = [10, 20, 40, 80];
Errores = zeros(length(N), 1);
Errores_dados = [0.0151, 0.0039, 9.7229e-4, 2.4342e-4];
c=0.1;
for i = 1:length(N)
        figure(i);
        [x, u] = sol_real(c);
        [x, u2] = sol_real(c+0.1);
        [x, u3] = sol_real(c+0.2);
        [U, EST] = fem(c, N(i));
        [U2, EST2] = fem(c+0.1, N(i));
        [U3, EST3] = fem(c+0.2, N(i));
        Errores(i) = EST
        h=1/N(i);
        hold on;
        plot(0:h:1, [0;U;0])
        plot(0:h:1, [0;U2;0])
        plot(0:h:1, [0;U3;0])
        plot(x, u);
        plot(x, u2);
        plot(x, u3);
        hold off;
        title('N = '+string(N(i)));
end
figure(40)
legend;
loglog(N, Errores, N, Errores_dados);
legend('Errores conseguidos con FEM; pendiente = '+string(pendiente(log(N), log(Errores))), 'Errores dados; pendiente = '+string(pendiente(log(N), log(Errores_dados))))
