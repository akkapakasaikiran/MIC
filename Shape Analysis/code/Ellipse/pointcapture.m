x = 39;
s2 = num2str(x);
s1 = strcat("../../data/ellipse/",s2,".jpg");
I = imread(s1);
imshow(I);
[x,y]=getpts;
outs = [x,y];
save("../../data/ellipse/"+s2+".mat",'outs');
