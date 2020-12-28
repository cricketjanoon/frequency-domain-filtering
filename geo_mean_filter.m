function [filtered_img] = geo_mean_filter(img, kernel_size)

[r, c] = size(img);

% padding the image
padding = (kernel_size-1)/2;
new_image = ones(r+(2*padding), c+(2*padding));
new_image(padding+1:padding+r, padding+1:padding+c) = double(img);

filtered_img = zeros(size(new_image));

for i=1+padding : padding+r
    for j=1+padding : padding+c
        S = new_image(i-padding:i+padding, j-padding:j+padding);
        filtered_img(i, j) = (prod(S(:)))^(1/(r*c));
    end
end

% removing the black border of padding
filtered_img = filtered_img(padding+1:padding+r, padding+1:padding+c);

end