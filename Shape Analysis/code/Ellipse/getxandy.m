function [x,y] = getxandy(shape)
    [n,~] = size(shape); n=n/2;
    x=shape(1:n);
    y=shape(n+1:2*n);
end