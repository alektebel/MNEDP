function [x, y] = sol_real(c)
x  = 0:0.001:1;
y = (1/((1-exp(1/c))))*exp(x./c) - 1/((1-exp(1/c))) + x;    