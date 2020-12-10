function [U, EST] = fem(c, N)
h= 1/N;
x  = 0:h:1;
J = length(x)-1;
e=ones(J-1, 1);
M = spdiags([-1/2*e 0*e 1/2*e], -1:1, J-1, J-1);
%matriz de rigidez
K = spdiags([-e/h 2*e/h -e/h], -1:1, J-1, J-1);
F = ones(J-1, 1)*h;
U = (M+c*K)\F;
plot(x, [0;U;0]);
K_0 = 1 + 1/(sqrt(2)*c)
EST = K_0*h^2*(1+transpose( U)*K*U)/(c*(3.14)^2)

