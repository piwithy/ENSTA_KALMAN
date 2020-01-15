%% PART1

close all
clear
n=1000;Gx=[3,1;1,3]; xbar=[1;2];
x0 = randn(2,n);
figure
hold on; axis square;
plot(x0(1,:),x0(2,:),'b.');

x=xbar*ones(1,n)+sqrtm(Gx)*x0;
plot(x(1,:),x(2,:),'r.');
legend('x0','x');

draw_ellipse(xbar, Gx, 0.9,'b', 3);
draw_ellipse(xbar,Gx,0.99,'r',3);
draw_ellipse(xbar,Gx,0.999, 'y',3);

%% PART2