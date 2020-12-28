clear; 
clc;

h = [-1 0 -1; -1 0 -1; -1 0 -1];
img = double(imread("cman.pgm"));

g = myFreqConv(img, h);

imshow(g, []);
