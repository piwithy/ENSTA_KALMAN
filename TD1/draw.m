function draw(x,u)
   alpha=1; beta=1; L=1; v = alpha*u(1); delta=beta*u(2); 
   mChassis=[0 -2 -1 -1 -2 -2 -1 -1 -2 0 -1 -1 4  4 -1;
            -2 -2 -2 -1 -1  1  1  2  2 2  2  1 1 -1 -1;
             1  1  1  1  1  1  1  1  1 1  1  1 1  1  1];
   mrav=[-1 1;
          0 0;
          1 1];
   
   R=[cos(x(3)) -sin(x(3)) x(1);
      sin(x(3)) cos(x(3)) x(2);
      0 0 1];
   Ravd=[cos(delta) -sin(delta) 3;
         sin(delta) cos(delta) -2;
         0 0 1];
   Ravg=[cos(delta) -sin(delta) 3;
       sin(delta) cos(delta) 2;
       0 0 1];
        
   
   mChassis=R*mChassis;
   mravd = R*Ravd*mrav;
   mravg = R*Ravg*mrav;
   hold on
   xlim([-4 6])
   ylim([-4 4])
   plot(mChassis(1,:), mChassis(2,:),'b');
   plot(mravd(1,:), mravd(2,:),'r');
   plot(mravg(1,:), mravg(2,:),'r');
end