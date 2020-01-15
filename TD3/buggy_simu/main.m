% Global variables to share with other files.
global u;
global bExit;
global scale, global offsetx, global offsety;
global L, global alpha, global beta;

% Controls are z,s,q,d keys, zoom with +,-, move camera with i,j,k,l and stop with ESC.

% Create a figure that will use the function keycontrol() when a key is
% pressed.
fig = figure('Position',[200 200 400 400],'KeyPressFcn','keycontrol','Name','Buggy simu','NumberTitle','off');
% Force the figure to have input focus (required to capture keys).
set(fig,'WindowStyle','Modal');
axis('off');

bExit = 0;
scale = 5; offsetx = 0; offsety = 0;

L = 0.5; %Distance (en m) entre essieux avant et arriere.
alpha = 2.0; %Coefficient (en m/s) a regler en regardant la vitesse du buggy pour une entree u(1) donnee.
beta = 0.7; %Coefficient (en rad) a regler selon l'angle max des roues de la direction avant.

x = [0;0;0];
u = [0;0];
dt = 0.05;
t = 0;

while (bExit == 0)
    % Simulated state evolution.
    x = x+(f(x,u)+mvnrnd([.01;-0.02;0.0001],diag([.01;.01;.01])))*dt;  
    y=g(x,u)+mvnrnd([.1;-0.2;0.001],diag([.01;.01;.001]));
    
    clf;
    hold on;
    axis([-scale+offsetx,scale+offsetx,-scale+offsety,scale+offsety]); axis square;
    % draw(y,u);
    draw(x,u);
    draw_ellipse([y(1);y(2)], diag([.02;.03]),.9,'r', 2);
    % Wait a little bit.
    pause(0.02); % <dt because there are also computations delays...
    t = t+dt;
end

t

close(fig);
