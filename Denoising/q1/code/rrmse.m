function val = rrmse(a,b)
    num = norm(a-b,'fro');
    den = norm(a,'fro');
    val = num/den;
end