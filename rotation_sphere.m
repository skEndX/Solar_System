A=[0 50 50 0 0; 0 0 20 20 0; 4 4 4 4 4; 1 1 1 1 1];
A2=[0 50 50 0 0; 0 0 20 20 0; 4 4 4 4 4; 1 1 1 1 1];
A3=[0 50 50 0 0; 0 0 20 20 0; 4 4 4 4 4; 1 1 1 1 1];
A2(2,:)=A(2,:)-140;
A3(2,:)=A(2,:)+80;

set(gcf,'color','k');
[x1,x2,x3] = sphere;
orbit1=[0,0,0]; orbit2=[0,0,0]; orbit3=[0,0,0];
x=0;
for d = 0:0.2:90
   x=x-2.5;
   AA=[1 0 0 x; 0 cos(90) sin(90) 0; 0 -sin(90) cos(90) 0; 0 0 0 1]*A;
   AA2=[1 0 0 x; 0 cos(d) sin(d) 0; 0 -sin(d) cos(d) 0; 0 0 0 1]*A2;
   AA3=[1 0 0 x; 0 cos(d/5) sin(d/5) 0; 0 -sin(d/5) cos(d/5) 0; 0 0 0 1]*A3;

   clf; hold on; axis off;
   axis([-900-d*7 100-d*7 -150 150 -250 250]);
   view([20 100 90]);
    
   orbit1= [orbit1; AA(1,1) AA(2,1) AA(3,1)];
   line(orbit1(:,1), orbit1(:,2), orbit1(:,3),'color','r');
   orbit2 = [orbit2; AA2(1,1) AA2(2,1) AA2(3,1)];
   line(orbit2(:,1), orbit2(:,2), orbit2(:,3),'color','g');
   orbit3=[orbit3; AA3(1,1) AA3(2,1) AA3(3,1)];
   line(orbit3(:,1), orbit3(:,2), orbit3(:,3),'color','b');
   
   surf(50*x1+AA(1,1), 50*(cos(d/10)*x2+sin(d/10)*x3)+AA(2,1), 50*(cos(d/10)*x3-sin(d/10)*x2)+AA(3,1), 'FaceColor', 'r');   
   surf(15*x1+AA2(1,1), 15*x2+AA2(2,1), 15*x3+AA2(3,1), 'FaceColor', 'g');
   surf(30*x1+AA3(1,1), 30*(sin(d)*x1+cos(d)*x2)+AA3(2,1), 30*(cos(d)*x3-sin(d)*x2)+AA3(3,1), 'FaceColor', 'b');
   surf(30*x1+AA3(1,1), 30*x2+AA3(2,1), 30*x3+AA3(3,1), 'FaceColor', 'b');
   pause(0.001);       
end