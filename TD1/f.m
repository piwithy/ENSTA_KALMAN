function [X_dot] = f(X,U)
    L=1;alpha = 1;beta =1;
    v=X(4);
    theta=X(3);
    delta=X(5);
    
    x_dot = v*cos(delta)*cos(theta);
    y_dot = v*cos(delta)*sin(theta);
    theta_dot = (v*sin(delta))/L;
    v_dot= alpha*U(1);
    delta_dot = beta*U(2);
    X_dot = [x_dot, y_dot, theta_dot, v_dot,delta_dot];
end