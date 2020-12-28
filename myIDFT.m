function [X] = myIDFT(ft)
%IDFT Summary of this function goes here
%   Detailed explanation goes here

% https://www.researchgate.net/publication/319226292_Computation_of_IDFT_through_forward_DFT

% Exchanging real and imaginary part
real_part = real(ft);
imag_part = imag(ft);
ft = complex(imag_part, real_part);

% computing DFT
X = myDFT(ft);

% exchanging real and imaginary part again
real_part_x = real(X);
imag_part_x = imag(X);
X = complex(imag_part_x, real_part_x);

% return the abs value for display
X = abs(X);

% EXPLICIT IDFT
% [r, c] = size(ft);
% col_basis_matrix= exp((2*pi*1i/c)*(0:c-1)'*(0:c-1)); % creating column basis matrix
% row_basis_matrix = exp((2*pi*1i/r)*(0:r-1)'*(0:r-1)); % creating row basis matrix
% X = row_basis_matrix * ft * col_basis_matrix;
% X = abs(X);

end

