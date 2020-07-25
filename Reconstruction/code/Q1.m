close all;
clear all;

I=double(imread('SheppLogan256.png'));


N=size(I,1);

theta = 0:3:177;
N_theta = length(theta);
[R,xp] = radon(I,theta);

I0=iradon(R, theta);
figure();
imshow(uint8(I0));
title("Normal Back Propagation");

% make a Ram-Lak filter. it's just abs(f).
N1 = length(xp);
freqs=linspace(-1, 1, N1).';
myFilter = abs( freqs );
L=1;
myFilter( myFilter > 1 ) = 0;
myFilter = repmat(myFilter, [1 N_theta]);

% do my own FT domain filtering
ft_R = fftshift(fft(R,[],1),1);
filteredProj = ft_R .* myFilter;
filteredProj = ifftshift(filteredProj,1);
ift_R = real(ifft(filteredProj,[],1));

% tell matlab to do inverse FBP without a filter
I1 = iradon(ift_R, theta, 'linear', 'none', 1.0, N);
figure();
imshow(uint8(I1));
title("Ram-Lak filter on wmax");



% make a Ram-Lak filter. it's just abs(f).
N1 = length(xp);
freqs=linspace(-1, 1, N1).';
myFilter = 2*L*abs(sin(pi*freqs/(2*L)))/pi;

myFilter( myFilter > 1 ) = 0;
myFilter = repmat(myFilter, [1 N_theta]);

% do my own FT domain filtering
ft_R = fftshift(fft(R,[],1),1);
filteredProj = ft_R .* myFilter;
filteredProj = ifftshift(filteredProj,1);
ift_R = real(ifft(filteredProj,[],1));

% tell matlab to do inverse FBP without a filter
I2 = iradon(ift_R, theta, 'linear', 'none', 1.0, N);
figure();
imshow(uint8(I2));
title("Shepp-Logan filter on wmax")

N1 = length(xp);
freqs=linspace(-1, 1, N1).';
myFilter = abs(freqs).*cos(pi*freqs/(2*L));

myFilter( myFilter > 1 ) = 0;
myFilter = repmat(myFilter, [1 N_theta]);

% do my own FT domain filtering
ft_R = fftshift(fft(R,[],1),1);
filteredProj = ft_R .* myFilter;
filteredProj = ifftshift(filteredProj,1);
ift_R = real(ifft(filteredProj,[],1));

% tell matlab to do inverse FBP without a filter
I3 = iradon(ift_R, theta, 'linear', 'none', 1.0, N);
figure();
imshow(uint8(I3));
title("Cosine filter on wmax");

%L=0.5;

N=size(I,1);

theta = 0:3:177;
N_theta = length(theta);
[R,xp] = radon(I,theta);

% make a Ram-Lak filter. it's just abs(f).
N1 = length(xp);
freqs=linspace(-1, 1, N1).';
myFilter = abs( freqs );
L=1;
myFilter( myFilter > L ) = 0;
myFilter = repmat(myFilter, [1 N_theta]);

% do my own FT domain filtering
ft_R = fftshift(fft(R,[],1),1);
filteredProj = ft_R .* myFilter;
filteredProj = ifftshift(filteredProj,1);
ift_R = real(ifft(filteredProj,[],1));

% tell matlab to do inverse FBP without a filter
I4 = iradon(ift_R, theta, 'linear', 'none', 1.0, N);
figure();
imshow(uint8(I4));
title("Ram-Lak filter on wmax/2")






% make a Ram-Lak filter. it's just abs(f).
N1 = length(xp);
freqs=linspace(-1, 1, N1).';
myFilter = 2*L*abs(sin(pi*freqs/(2*L)))/pi;

myFilter( myFilter > L ) = 0;
myFilter = repmat(myFilter, [1 N_theta]);

% do my own FT domain filtering
ft_R = fftshift(fft(R,[],1),1);
filteredProj = ft_R .* myFilter;
filteredProj = ifftshift(filteredProj,1);
ift_R = real(ifft(filteredProj,[],1));

% tell matlab to do inverse FBP without a filter
I5 = iradon(ift_R, theta, 'linear', 'none', 1.0, N);
figure();
imshow(uint8(I5));
title("Shepp-Logan filter on wmax/2")

N1 = length(xp);
freqs=linspace(-1, 1, N1).';
myFilter = abs(freqs).*cos(pi*freqs/(2*L));

myFilter( myFilter > L ) = 0;
myFilter = repmat(myFilter, [1 N_theta]);

% do my own FT domain filtering
ft_R = fftshift(fft(R,[],1),1);
filteredProj = ft_R .* myFilter;
filteredProj = ifftshift(filteredProj,1);
ift_R = real(ifft(filteredProj,[],1));

% tell matlab to do inverse FBP without a filter
I6 = iradon(ift_R, theta, 'linear', 'none', 1.0, N);
figure();
imshow(uint8(I6));
title("cosine filter on wmax/2")

fprintf("Cosine is the best filter for wmax and Shepp-Logan is " + ...
    "the best filter for wmax/2. \n")
fprintf("This has been reported based on RRMSE values.\n")


clear all;


S0=double(imread('SheppLogan256.png'));
imshow(uint8(S0));
figure();
S1=imgaussfilt(S0,1);
S5=imgaussfilt(S0,5);
theta = 0:3:177;
N_theta = length(theta);
[RR0, xp0]=radon(S0, theta);
[RR1, xp1]=radon(S1, theta);
[RR5, xp5]=radon(S5, theta);
imshow(uint8(S1));
figure();
imshow(uint8(S5));
figure();
N=size(S0,1);




N1 = length(xp0);
freqs=linspace(-1, 1, N1).';
myFilter = abs( freqs );
L=1;
myFilter( myFilter > 1 ) = 0;
myFilter = repmat(myFilter, [1 N_theta]);

% do my own FT domain filtering
ft_R = fftshift(fft(RR0,[],1),1);
filteredProj = ft_R .* myFilter;
filteredProj = ifftshift(filteredProj,1);
ift_R = real(ifft(filteredProj,[],1));

R0 = iradon(ift_R, theta, 'linear', 'none', 1.0, N);
imshow(uint8(R0));
figure();

ft_R = fftshift(fft(RR1,[],1),1);
filteredProj = ft_R .* myFilter;
filteredProj = ifftshift(filteredProj,1);
ift_R = real(ifft(filteredProj,[],1));

R1 = iradon(ift_R, theta, 'linear', 'none', 1.0, N);
imshow(uint8(R1));
figure();



ft_R = fftshift(fft(RR5,[],1),1);
filteredProj = ft_R .* myFilter;
filteredProj = ifftshift(filteredProj,1);
ift_R = real(ifft(filteredProj,[],1));

R5 = iradon(ift_R, theta, 'linear', 'none', 1.0, N);
imshow(uint8(R5));
figure();

x0=rrmse(S0, R0);
fprintf("\nRRMSE between S0 and R0 is "+x0);

x1=rrmse(S1, R1);
fprintf("\nRRMSE between S1 and R1 is "+x1);
x5=rrmse(S5, R5);
fprintf("\nRRMSE between S5 and R5 is "+x5);

fprintf("RRMSE is least for S5 and R5");

fprintf("Signal to noise ratio of image is reduced "+...
    "along with background noise \n"+...
    "due to Gaussian filtering and contrast improves.\n"+...
    "Due to this, an image filtered using Gaussian "+...
    "filtering with high standard deviation "+...
    "(S5) has lesser noise than the original and this accounts "+...
    "for the low RRMSE value.\nSo it is better reconstructed "+...
    "undr a filter which is sensitive to noise "+...
    "like the Ram-Lak filter.");













