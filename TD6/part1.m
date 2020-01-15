close all
clear
A0=[.5 0;0 1];u0=[8;16];c0=[1 1];y0=7;
A1=[1 -1;1 1];u1=[-6;18];c1=[1 1];y1=30;
A2=[1 -1;1 1];u2=[32;-8];c2=[1 1];y2=-6;

Galpha=diag([1;1]); Gbeta=1;
x=[0;0]; G=diag([100;100]);

figure;clf;hold on;axis([-100,100,-100,100]);axis square
draw_ellipse(x,G,.99,'m',2);

[x1,G1,x0up,G0up]=kalman(x,G,u0,y0,Galpha,Gbeta,A0,c0);
draw_ellipse(x0up,G0up, .99,'r',2);
draw_ellipse(x1,G1,.99,'g',2);

[x2,G2,x1up,G1up]=kalman(x1,G1,u1,y1,Galpha,Gbeta,A1,c1);
draw_ellipse(x1up,G1up, .99,'y',2);
draw_ellipse(x2,G2,.99,'b',2);

[x3,G3,x2up,G2up]=kalman(x2,G2,u2,y2,Galpha,Gbeta,A2,c2);
draw_ellipse(x2up,G2up, .99,'c',2);
draw_ellipse(x3,G3,.99,'k',2);
