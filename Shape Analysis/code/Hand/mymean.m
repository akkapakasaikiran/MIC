% data is a 2n*m matrix. Each column is a pointset
function mu = mymean(data)
    [n,m] = size(data); n=n/2;
    mu = data(:,1);
    for it=1:m
        data(:,it)=align(mu,data(:,it));
    end
    mu = (sum(data')/m)';
    mu = mu/norm(mu);
end