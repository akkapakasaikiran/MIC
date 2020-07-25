close all;
clear all;

I=double(imread('ChestPhantom.png'));
imshow(I);
R=radon(I);

x=zeros(16384, 1);
A=zeros(33300, 16384);

for i=1:16384
    x(i, 1)=1;
    x2=reshape(x, 128, 128);
    R2=radon(x2);
    R3=reshape(R2, 33300, 1);
    A(:, i)=R3;
    x(i, 1)=0;
end

I2=reshape(I, 16384, 1);
b=mtimes(A, I2);
bf=reshape(b, 185, 180);
y=range(bf, 'all');
figure();
imshow(bf);

y=0.02*y;

bf2=imnoise(bf, "gaussian", 0, 0.001);
figure()
imshow(bf2);

I2 = iradon(bf,0:179,max(size(I)),'cosine');
figure();
imshow(I2);

rr = rrmse(I2,I);
fprintf("RRMSE value between the reconstructed and original image is " + rr);


fprintf("\nWe vectorize a 128*128 null matrix " + ...
    "and set elements of it as 1 one at a time. \n" + ...
    "Then we reshape it back to a 128*128 matrix and " + ...
    "apply the Radon transform on it. \nWe then "+...
    "vectorise the output of the radon transform "+...
    "and insert it in the system matrix A");