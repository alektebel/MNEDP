function b = pendiente(x, y)
b=0;
n=0;
d=0;
x_hat = sum(x)/length(x);
y_hat = sum(y)/length(y);
    for i=1:length(x)
        n= n+(x(i)-x_hat)*(y(i)-y_hat);
        d = d+(x(i)-x_hat)^2
    end
b = n/d