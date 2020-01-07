clear
close all

global alpha;global beta;global L;
global u;
global bExit;
global scale;
bExit=0;
scale=20;
alpha=1;beta=1;L=4;
u=[0,0]
x=[0;0;0];
dt=0.01;t=0;
fig = figure('Position',[200 200 400 400],'KeyPressFcn','keycontrol','Name','Buggy Sim','NumberTitle','off');
% Force the figure to have input focus (required to capture keys).
set(fig,'WindowStyle','Modal');
axis('off');

while (bExit~=1)
    x=x+dt*f(x,u);
    clf;hold on; axis([-scale,scale,-scale,scale]);axis square; draw(x,u)
    pause(dt)
    t=t+dt;
end