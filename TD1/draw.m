function draw(x,u)
   global alpha;global beta;global L;
   v = alpha*u(1); delta=beta*u(2); 
   mChassis=[0 -2 -1 -1 -2 -2 -1 -1 -2 0 -1 -1 3 3 3 4  4 -1  3  3  3;
            -2 -2 -2 -1 -1  1  1  2  2 2  2  1 1 2 1 1 -1 -1 -1 -2 -1;
             1  1  1  1  1  1  1  1  1 1  1  1 1 1 1 1  1  1  1  1  1];
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
   plot(mChassis(1,:), mChassis(2,:),'r');
   plot(mravd(1,:), mravd(2,:),'g');
   plot(mravg(1,:), mravg(2,:),'g');
end