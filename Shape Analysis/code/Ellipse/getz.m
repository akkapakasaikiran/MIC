function z = getz(x,y);
    [n,~]=size(x);
    z=zeros(2*n,1);
    z(1:n)=x;
    z(n+1:2*n)=y;
end