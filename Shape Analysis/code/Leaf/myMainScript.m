load("/MATLAB Drive/Leaf/mainmat.mat")
shapes = mainmat;
shapes(32,:)=shapes(1,:);
shapes(64,:)=shapes(33,:);
[n,m] = size(shapes); n=n/2;
shapes(1:n,:)=shapes(1:n,:)-mean(shapes(1:n,:),1);
shapes(1+n:2*n,:)=shapes(1+n:2*n,:)-mean(shapes(1+n:2*n,:),1);


close all;
figure();
[n,m] = size(shapes); n=n/2;
for x = 1:m
    plot(shapes(1:n,x),shapes(n+1:2*n,x),'-'); 
    hold on;
end
hold off;

mu = mymean(shapes);

figure();
shapes2=shapes;
for x=1:m
    shapes2(:,x)=align(mu,shapes2(:,x));
    plot(shapes2(1:n,x),shapes2(n+1:2*n,x),'-');
    hold on;
end
plot(mu(1:n),mu(n+1:2*n),'-','color','black', ...
   'LineWidth',3);
title("Mean and shapes aligned with the mean");
hold off;


[myco,vectors,values] = mycov(shapes);
onetom=linspace(1,2*n,2*n);
figure();
plot(onetom,values(2*n:-1:1));
title("Eigenvalues");

figure();
for x=3:-1:1
    plus = mu+3*values(2*n)*vectors(:,2*n-x+1);
    minus = mu-3*values(2*n)*vectors(:,2*n-x+1);  
    
    plus = align(mu,plus);
    subplot(3,3,3*(x-1)+1);
    plot(plus(1:n),plus(n+1:2*n));
    
    subplot(3,3,3*(x-1)+2);
    plot(mu(1:n),mu(n+1:2*n));
    title(strcat('Modes of variation  ',num2str(x)));
    
    minus = align(mu,minus);
    subplot(3,3,3*(x-1)+3);
    plot(minus(1:n),minus(n+1:2*n));
    
end

figure()
ref = mu;
best = shapes(:,1);
bestdist=100000;
for x=1:m
    shapes2(:,x)=align(ref,shapes(:,x));
    if(norm(shapes2(:,x)-ref) < bestdist)
        best = shapes2(:,x);
        bestdist = norm(best-ref);
    end
end
plot(mu(1:n),mu(n+1:2*n));
title("Closest shape for mu-3*lambda*v1");
hold on;
plot(best(1:n),best(n+1:2*n));
hold off;

figure();
ref = minus;
best = shapes(:,1);
bestdist=100000;
for x=1:m
    shapes2(:,x)=align(ref,shapes(:,x));
    if(norm(shapes2(:,x)-ref) < bestdist)
        best = shapes2(:,x);
        bestdist = norm(best-ref);
    end
end
plot(ref(1:n),ref(n+1:2*n));
title("Closest shape for mu");
hold on;
plot(best(1:n),best(n+1:2*n));
hold off;

figure();
ref = plus;
best = shapes(:,1);
bestdist=100000;
for x=1:m
    shapes2(:,x)=align(ref,shapes(:,x));
    if(norm(shapes2(:,x)-ref) < bestdist)
        best = shapes2(:,x);
        bestdist = norm(best-ref);
    end
end
plot(ref(1:n),ref(n+1:2*n));
title("Closest shape : mu-3*lambda*v1");
hold on;
plot(best(1:n),best(n+1:2*n));
hold off;

