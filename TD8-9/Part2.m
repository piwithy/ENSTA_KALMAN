close all
clear
global alpha; global beta;global L; global u;
alpha=1;beta=1;L=.5;
global bExit; global scale;
bExit=0;scale=10;
u=[0 0]; x=[0;0;0];t=0;dt=.05;
zk=[0;0];Gzk=diag([.1;.1]);


fig = figure('Position',[200 200 400 400],'KeyPressFcn','keycontrol','Name','Buggy simu','NumberTitle','off');
while(bExit==0)
    x=x+dt*f(x,u);
    y=g(x,u);
    yk=[];Gbeta=[];Ck=[];
    Ak=[1 0; 0 1];
    uk=[dt*alpha*u(1)*cos(beta*u(2))*cos(y);
        dt*alpha*u(1)*cos(beta*u(2))*sin(y)];
    Galphak =diag([.01;.01]);
    
    [zk,Gzk,zkup,Gzkup] = kalman(zk,Gzk,uk,yk,Galphak, Gbeta,Ak,Ck);
    
    clf
    hold on;axis([-scale,scale,-scale,scale]); axis square;
    draw(x,u);draw_ellipse([zk(1); zk(2)], [Gzk(1,1) Gzk(1,2);Gzk(2,1) Gzk(2,2)],.99,'r',2);
    
    pause(0.02);
    t=t+dt;
end
t
close all

