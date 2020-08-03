function [value, der] = quadratic(X, gamma)
    X = double(X);
    [n,m] = size(X);
    up = X;
    up(1:n-1,:) = X(2:n,:);
    up(n,:) = X(1,:);
    down = X;
    down(2:n,:) = X(1:n-1,:);
    down(1,:) = X(n,:);
    right = X;
    right(:,2:m) = X(:,1:m-1);
    right(:,1) = X(:,m);
    left = X;
    left(:,1:m-1) = X(:,2:m);
    left(:,m) = X(:,1);
    
   
    value = zeros(n,m);
    value = value + (X-up).*(X-up);
    value = value + (X-down).*(X-down);
    value = value + (X-right).*(X-right);
    value = value + (X-left).*(X-left);
    
    der = zeros(n,m);
    der = der + 2*(X - up);
    der = der + 2*(X- down);
    der = der + 2*(X - right);
    der = der + 2*(X - left);
    
end