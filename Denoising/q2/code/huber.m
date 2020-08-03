function [value, der] = huber(X, gamma)    
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
    for i = 1:n
        for j = 1:m
            if abs(X(i,j)-up(i,j)) <= gamma
                value(i,j) = value(i,j) + 0.5*(X(i,j)-up(i,j))^2;   
            else 
                value(i,j) = value(i,j) + gamma*abs(X(i,j)-up(i,j)) - 0.5*gamma^2;
            end
            if abs(X(i,j)-down(i,j)) <= gamma
                value(i,j) = value(i,j) + 0.5*(X(i,j)-down(i,j))^2;   
            else 
                value(i,j) = value(i,j) + gamma*abs(X(i,j)-down(i,j)) - 0.5*gamma^2;
            end
            if abs(X(i,j)-right(i,j)) <= gamma
                value(i,j) = value(i,j) + 0.5*(X(i,j)-right(i,j))^2;  
            else 
                value(i,j) = value(i,j) + gamma*abs(X(i,j)-right(i,j)) - 0.5*gamma^2;
            end
            if abs(X(i,j)-left(i,j)) <= gamma
                value(i,j) = value(i,j) + 0.5*(X(i,j)-left(i,j))^2;   
            else 
                value(i,j) = value(i,j) + gamma*abs(X(i,j)-left(i,j)) - 0.5*gamma^2;
            end
        end
    end
    
    der = zeros(n,m);
    for i = 1:n
        for j = 1:m
            if abs(X(i,j)-up(i,j)) <= gamma
                der(i,j) = der(i,j) + (X(i,j)-up(i,j));   
            else 
                der(i,j) = der(i,j) + gamma*sign(X(i,j)-up(i,j));
            end
            if abs(X(i,j)-down(i,j)) <= gamma
                der(i,j) = der(i,j) + (X(i,j)-down(i,j));   
            else 
                der(i,j) = der(i,j) + gamma*sign(X(i,j)-down(i,j));
            end
            if abs(X(i,j)-right(i,j)) <= gamma
                der(i,j) =der(i,j) +  X(i,j)-right(i,j);  
            else 
                der(i,j) = der(i,j) + gamma*sign(X(i,j)-right(i,j));
            end
            if abs(X(i,j)-left(i,j)) <= gamma
                der(i,j) = der(i,j) + X(i,j)-left(i,j);   
            else 
                der(i,j) = der(i,j) + gamma*sign(X(i,j)-left(i,j));
            end
        end
    end
end