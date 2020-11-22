%metodo de elementos finitos

clear all
close all
J=20;
h=1/20;
T=0.6;
delta_t = 1/(6*J^2);
N = round(T/delta_t);
%matriz de masa
e=ones(J-1, 1);
M = spdiags([h*e/6 4*h*e/6 h*e/6], -1:1, J-1, J-1);
%matriz de rigidez
K = spdiags([-e/h 2*e/h -e/h], -1:1, J-1, J-1);
%condicion inicial

x=[h:h:1-h];
x = x(:);
u0 = x.*(1-x);

ue = u0;
%euler explicito
for i = 1:N
    ue = (M-K*delta_t)*ue;
    ue=M\ue;
end
figure(1)
xn = [0:x:1];
ue = [0;ue;0];
plot(xn, ue)
title('metodo explicito')

%metodo explicito
ui = u0;
for i=1:N
    ui = M*ui;
    ui = (M+K*delta_t)\ui
end
ui=[0;ui;0];
figure(2);
plot(xn, ui);
title('metodo implicito');

