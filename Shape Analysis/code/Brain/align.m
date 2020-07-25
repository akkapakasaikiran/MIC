% assuming both pointsets have centroid origin
% pointsets are columns of size 2n
% first n are x then next n y
function z2 = align(z1,z2)
    [n,~] = size(z1); n=n/2;
    [x1,y1] = getxandy(z1);
    [x2,y2] = getxandy(z2);
    a = sum(x1.*x2 + y1.*y2)/sum(x2.*x2 + y2.*y2);
    b = sum(x2.*y1 - y2.*x1)/sum(x2.*x2 + y2.*y2);
    oldx2 = x2;
    x2 = a*x2 - b*y2;
    y2 = b*oldx2 + a*y2;
    z2a=getz(x2,y2);
    dist1 = norm(z1-z2a);
    z2=z2a;
    
    
    
    [x1,y1] = getxandy(z1);
    [x2,y2] = getxandy(z2);
    a = sum(x1.*x2 - y1.*y2)/sum(x2.*x2 + y2.*y2);
    b = sum(x2.*y1 + y2.*x1)/sum(x2.*x2 + y2.*y2);
    oldx2 = x2;
    x2 = a*x2 + b*y2;
    y2 = b*oldx2 - a*y2;
    z2b=getz(x2,y2);
    dist2=norm(z1-z2b);
    
    if(dist1 < dist2)
          z2=z2a;
      else
          z2=z2b;
    end
    
   
    
  
end