function [X,funcvals] = graddesc(Y, g, beta, gamma)
    X = Y;
    s = 0.1;
    [valg,~] = g(Y, gamma);
    oldfuncval = sum(beta*valg, 'all');
    [~, gradg] = g(Y, gamma);
    curgrad = beta*gradg;
    X = X - s*curgrad;
    [valg, ~] = g(X, gamma);
    newfuncval = sum((1-beta)*(Y-X).*(Y-X) + beta*valg,'all');
    
    funcvals = [oldfuncval,newfuncval];
    while s >= 1e-8
        [~, gradg] = g(X, gamma);
        curgrad = (1-beta)*2*(Y-X) + beta*gradg;
        X_dash = X - s*curgrad;
        [valg, ~] = g(X_dash, gamma);
        newfuncval = sum((1-beta)*(Y-X_dash).*(Y-X_dash) + beta*valg,'all');
        if newfuncval < oldfuncval
            s = s*1.1;
            X = X_dash;
            oldfuncval = newfuncval;
        else
            s = s*0.5;
        end   
        funcvals = [funcvals newfuncval];
    end
end