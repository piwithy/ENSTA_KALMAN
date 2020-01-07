function [X_dot] = f(X,U)
    global alpha;global beta;global L;
    v=alpha*U(1);
    delta=beta*U(2);
    X_dot=[v*cos(delta)*cos(X(3));
        v*cos(delta)*sin(X(3));
        v*sin(delta)/L];
end