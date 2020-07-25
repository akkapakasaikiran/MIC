% data is a 2n*m matrix. Each column is a pointset
function [myco, vectors, values] = mycov(data)
    [n,m] = size(data); n=n/2;
    mu = mymean(data);
    myco = zeros(2*n);
    for it=1:m
        data(:,it)=align(mu,data(:,it));
        diff = data(:,it)-mu;
        myco = myco + (diff*diff')/m;
    end
    [vectors,diagvalues] = eig(myco);
    values=sqrt(diag(diagvalues));
end