%matriz d laplaciano
n=15;
h=1/n;
e=ones(n-1, 1);
B=spdiags([-e 4*e -e], -1:1, n-1, n-1);
I=speye(n-1, n-1);
I1=spdiags([-e -e], [-1 1], n-1, n-1);
A = kron(I, B)+kron(I1, I)
figure(1)
spy(A)
[m, n] = lu(A);
figure(2)
spy(m)