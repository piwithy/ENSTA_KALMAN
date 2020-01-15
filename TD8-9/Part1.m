close all
clear
C0=[4 0];C1=[10 1];C2=[10 5];C3=[13 5];C4=[17 3];
y0=5;y1=10;y2=11;y3=14;y4=17;
A=diag([1;1]);Galpha=diag([0;0]);u=[0;0];Gbeta=9;
x0=[1;-1];Gx0=diag([4;4]);

figure; clf;hold on;axis([-10 10 -10 10]);axis square;
draw_ellipse(x0,Gx0,.99,'r',2);

[x1,Gx1,x0up,Gx0up]=kalman(x0,Gx0,u,y0,Galpha, Gbeta, A, C0);
%draw_ellipse(x0up, Gx0up, .99,'',2)
draw_ellipse(x1, Gx1, .99,'',2)

[x2,Gx2,x1up,Gx1up]=kalman(x1,Gx1,u,y1,Galpha, Gbeta, A, C1);
%draw_ellipse(x1up, Gx1up, .99,'',2)
draw_ellipse(x2, Gx2, .99,'',2)


[x3,Gx3,x2up,Gx2up]=kalman(x2,Gx2,u,y2,Galpha, Gbeta, A, C2);
%draw_ellipse(x2up, Gx2up, .99,'',2)
draw_ellipse(x3, Gx3, .99,'',2)


[x4,Gx4,x3up,Gx3up]=kalman(x3,Gx3,u,y3,Galpha, Gbeta, A, C3);
%draw_ellipse(x3up, Gx3up, .99,'',2)
draw_ellipse(x4, Gx4, .99,'',2)

[x5,Gx5,x4up,Gx4up]=kalman(x4,Gx4,u,y4,Galpha, Gbeta, A, C4);
%draw_ellipse(x3up, Gx3up, .99,'',2)
draw_ellipse(x5, Gx5, .99,'',2)

%legend("0", "0up", "1", "1up", "2", "2up","3", "3up", "4")
legend("0", "1", "2","3", "4", "5")

