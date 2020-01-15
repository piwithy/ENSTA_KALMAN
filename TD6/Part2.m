clear
close all;
global u;
global bExit;
global scale;
dt=0.05;
t=0;
x=[0;0;0;0;0];
zk=[0;0;0];Gzk=diag([1;1;1]);
u=[0,0];
alpha=[0 0 0];
scale=50;
bExit=0;

fig = figure('Position',[200 200 400 400],'KeyPressFcn','keycontrol','Name','Buggy simu','NumberTitle','off');
while(bExit==0)
    x=x+dt*f(x,u)+mvnrnd([0;0;0;0;0],diag([0;0;dt*0.01;dt*0.01;dt*0.01]));
    y=g(x,u);
    
    Galpha=diag([0;0;.01*dt]);
    Ak=[1 0 dt*cos(y(1))*cos(y(2));
        0 1 dt*sin(y(1))*cos(y(2));
        0 0 1];
    uk=[0;0;dt*u(1)];
    Ck=[0 0 1];yk=y(3);Gbeta=.1;
    
    [zk,Gzk,zkup,Gzkup]=kalman(zk,Gzk,uk,yk,Galpha,Gbeta,Ak,Ck);
    
    clf
    hold on;axis([-scale,scale,-scale,scale]); axis square;
    draw_car(x)
    draw_ellipse([zkup(1) ; zkup(2)],[Gzkup(1,1) Gzkup(1,2); Gzkup(2,1) Gzkup(2,2)],.99,'y',2);
    pause(0.02)
    t =t+dt;
end

close all

