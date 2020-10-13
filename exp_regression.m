function [Y] = exp_regression(J, X, C)
    Const = polyfit(log(J), log(X), 1);
    m=Const(1);
    k=Const(2);
    Y = C.^m.*exp(k);
    