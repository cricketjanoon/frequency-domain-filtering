function [filtered_img] = myFreqConv(img, h)
% getting the size of image and filters, and padding parameters
[m, n] = size(img);
[c, d] = size(h);
p = 2*m;
q = 2*n;

% creating zero-padding of image and filter
padded_img = complex(zeros(p, q));
padded_h = complex(zeros(p, q));
padded_img(1:m, 1:n) = img;
padded_h(1:c, 1:d) = h;

% computing dft of image and filter
F = myDFT(padded_img);
H = myDFT(padded_h);

% applying filter (using convolution theorem)
G = F .* H;

% converting image back to spatial domain
g = myIDFT(G);
g = g(1:m, 1:n); % removing extra padding

filtered_img = g;

end

