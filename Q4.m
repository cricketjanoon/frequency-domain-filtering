clear;
clc;

img = double(imread('filtering.tif'));

F = myDFT(img); % DFT of image
[m, n] = size(img); % image dimensions
cut_off_freq = 30; % cut-off frequency

% intermediate terms
[u, v] = dftuv(m, n);
distance_matrix = sqrt(u.^2 + v.^2);

% creating ideal-lowpass filter
H_ideal = double(distance_matrix <=2*cut_off_freq);

% creating butterworth lowpass filter
H_btw = 1./(1 + (distance_matrix./cut_off_freq).^(2));

% creating gaussain lowpass filter
H_gau = exp(-(distance_matrix.^2)./(2*(cut_off_freq^2)));

% Filtering with Ideal Lowpass filter
G_ideal = H_ideal .* F;
g_ideal = ifft2(G_ideal);
subplot(1, 3, 1); imshow(abs(g_ideal), []); %title("Result after applying Ideal low pass filter");

% Filtering with Butterworth Lowpass filter
G_btw = H_btw .* F;
g_btw = ifft2(G_btw);
subplot(1, 3, 2); imshow(abs(g_btw), []); %title("Result after applying Butterworth low pass filter");

% Filtering with Gaussain Lowpass filter
G_gau = H_gau .* F;
g_gau = ifft2(G_gau);
subplot(1, 3, 3); imshow(abs(g_gau), []); %title("Result after applying Gausssain low pass filter");