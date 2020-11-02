%matriz d laplaciano
n=15;
h=1/n;
e=ones(n-1, 1);
B=spdiags([-e 4*e -e], -1:1, n-1, n-1);
I=speye(n-1, n-1);
I1=spdiags([-e -e], [-1 1], n-1, n-1);
A = kron(I, B)+kron(I1, I)
A=A/h^2;
f=ones((n-1)^2, 1);
%aproximacion en los nodos inferiores
y=A\f;
%añado las condiciones de contorno Dirichlet homogéneas
val = zeros(n-1, n-1);
%En val(i, j) meto el valor del nodo (xi, yj)
for i = 1:n-1
    for j=1:n-1
        val(i, j) = y(j + (n-1)*(i-1));
    end
end
valnn = [zeros(n-1, 1)';val;zeros(n-1, 1)'];
valnn = [zeros(n+1, 1), valnn, zeros(n+1, 1)];
xx = linspace(0, 1, n+1);
yy = linspace(0, 1, n+1);
[X, Y] = meshgrid(xx, yy);
figure(3)
mesh(X, Y, valnn)


figure(1)
spy(A)
[m, n] = lu(A);
figure(2)
spy(m)
ml = ichol(sparse(A));
figure(4);
spy(ml)