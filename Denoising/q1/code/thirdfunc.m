function [value, der] = thirdfunc(X,gamma)    
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
    value = value + gamma*abs(X-up) - gamma*gamma*log(1 + ((abs(X-up))/gamma));
    value = value + gamma*abs(X-down) - gamma*gamma*log(1 + ((abs(X-down))/gamma));
    value = value + gamma*abs(X-right) - gamma*gamma*log(1 + ((abs(X-right))/gamma));
    value = value + gamma*abs(X-left) - gamma*gamma*log(1 + ((abs(X-left))/gamma));
    
    
    der = zeros(n,m);
    for i = 1:n
        for j = 1:m
            der(i, j) = der(i, j) + gamma*sign(X(i, j)-up(i, j));
            der(i, j) = der(i, j) - gamma*gamma*(1/(1+(abs(X(i, j)-up(i, j)))/gamma))*sign(X(i, j)-up(i, j))*(1/gamma);
            der(i, j) = der(i, j) + gamma*sign(X(i, j)-down(i, j));
            der(i, j) = der(i, j) - gamma*gamma*(1/(1+(abs(X(i, j)-down(i, j)))/gamma))*sign(X(i, j)-down(i, j))*(1/gamma);
            der(i, j) = der(i, j) + gamma*sign(X(i, j)-left(i, j));
            der(i, j) = der(i, j) - gamma*gamma*(1/(1+(abs(X(i, j)-left(i, j)))/gamma))*sign(X(i, j)-left(i, j))*(1/gamma);
            der(i, j) = der(i, j) + gamma*sign(X(i, j)-right(i, j));
            der(i, j) = der(i, j) - gamma*gamma*(1/(1+(abs(X(i, j)-right(i, j)))/gamma))*sign(X(i, j)-right(i, j))*(1/gamma);
        end
    end
    
    
end