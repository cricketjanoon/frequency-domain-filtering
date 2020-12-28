clear; 
clc;

img = double(imread('degradation.tif'));

arith_mean_filter = 1/9*[1, 1, 1; 1, 1, 1; 1, 1, 1];

result_geo_filter = imfilter(log(img), ones(3, 3), 'replicate');
result_geo_filter = exp(result_geo_filter);
result_geo_filter = result_geo_filter .^ (1/numel(ones(3, 3)));

result_ari_filter = myFreqConv(img, arith_mean_filter);

subplot(1, 3, 1); imshow(img, []); title("Original Image");
subplot(1, 3, 2); imshow(result_ari_filter, []); title("Arithematic Mean filtered Image");
subplot(1, 3, 3); imshow(result_geo_filter, []); title("Geometric Mean filtered Image");