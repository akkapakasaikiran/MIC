close all;
clear all;

chestct = double(imread("ChestCT.png"))/255;
shepp = double(imread("SheppLogan256.png"))/255;

evals = zeros(181,1);
emin = 1;
bestpic = shepp;
xmin = -1;
for x = 0:180
    theta = x:x+150;
    rshepp = radon(shepp,theta);
    irshepp = iradon(rshepp,theta,max(size(shepp)));
    evals(x+1,1) = rrmse(irshepp,shepp);
    if(evals(x+1,1) < emin)
        emin = evals(x+1,1);
        bestpic = irshepp;
        xmin = x;
    end
end

figure();
plot(evals);
title("SheppLogan Image");
xlabel("theta_{initial}");
ylabel("RRMSE Values");
xminshepp = xmin;
figure()
imshow(bestpic);
title("Reconstructed SheppLogan with min RRMSE");

evals = zeros(181,1);
emin = 100;
bestpic = chestct;
xmin = -1;
for x = 0:180
    theta = x:x+150;
    rc = radon(chestct,theta);
    irc = iradon(rc,theta,max(size(chestct)));
    evals(x+1,1) = rrmse(irc,chestct);
    if(evals(x+1,1) < emin)
        emin = evals(x+1,1);
        bestpic = irc;
        xmin = x;
    end
end

figure();
plot(evals);
title("Chest CT Image");
xlabel("theta_{initial}");
ylabel("RRMSE Values");

xminchestct = xmin;
figure()
imshow(bestpic);
title("Reconstructed Chest CT with min RRMSE");

