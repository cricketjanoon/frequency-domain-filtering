function [ft, log_magnitude, phase_img] = myDFT(img, fast)
%DFT Summary of this function goes here
%   Detailed explanation goes here

% just to handle default parameter
if nargin < 2
    fast = 1;
end

[r, c] = size(img);
img = double(img);
ft = complex(zeros(r, c), 0);

% matrix based fast implemenation of fourier transform
if fast == 1
    col_basis_matrix = exp((-2*pi*1i/c)*(0:c-1)'*(0:c-1)); % creating column basis matrix
    row_basis_matrix = exp((-2*pi*1i/r)*(0:r-1)'*(0:r-1)); % creating row basis matrix
    ft = row_basis_matrix * img * col_basis_matrix;
    log_magnitude = log(1 + abs(ft));
    phase_img = atan2(imag(ft), real(ft));
    return
end

% naive loop based implementation
for u=1:r
    for v=1:c
        for x=1:r
            for y=1:c
                ft(u, v) = ft(u, v) + (double(img(x,y)) * exp(-1i*2*pi*((u*x/r)+(v*y/c))));
            end
        end
    end
end

log_magnitude = log(1 + abs(ft));
phase_img = atan2(imag(ft), real(ft));

end