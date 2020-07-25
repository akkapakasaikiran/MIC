x = 39;
s2 = num2str(x);
s1 = strcat("../../data/brain/mri_image_",s2,".png");
I = imread(s1);
imshow(I);
[x,y]=getpts;
outs = [x,y];
save("../../data/brain/"+s2+".mat",'outs');
