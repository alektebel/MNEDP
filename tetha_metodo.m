function [x, U, tiempo] = theta_metodo(theta, J, T, nu, mu)
	%Calculo de N y mu
    if nu>0
		N=ceil(T*J^2/nu);%Redondeo hacia arriba para que no haya problemas de convergencia
        mu=nu/J;
	elseif mu>0
		N=ceil(T*J/mu);
		nu=mu*J;
    end
	%particion espacial y condicion inicial
	x=linspace(1/J, 1-1/J, J-1);
	U=(x.*(1-x));
    
    v=ones(J-1,1);
    %Metemos los vectores de las diagonales
    %diagonal principal
    dp_A = (1+2*nu*theta)*v;
    %diagonal inferior
    di_A = -nu*theta*v;
    %diagonal superior
    ds_A=di_A;
    %creamos la matriz
    A=spdiags([di_A dp_A ds_A], -1:1, J-1, J-1);

    %Metemos los vectores de las diagonales
    %diagonal principal
    dp_b = v*(1-2*((1-theta)*nu));
    %diagonal inferior
    di_b = nu*(1-theta)*v;
    %diagonal superior
    ds_b=di_b;
    %creamos la matriz
    B=spdiags([di_b dp_b ds_b], -1:1, J-1, J-1);
    U=transpose(U);
    tic;
    for t=1:N         
        U = B*U;
        U = A\U;
    end 
    tiempo=toc;
    