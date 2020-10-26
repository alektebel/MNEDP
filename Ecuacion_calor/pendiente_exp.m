function m = pendiente_exp(J, X)
    Const = polyfit(log(J), log(X), 1);
    m=Const(1);