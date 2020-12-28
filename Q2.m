img = imread('cman.pgm');

[ft, log_magnitude, ~] = myDFT(img);
reg_img = myIDFT(ft);

subplot(1, 3, 1); imshow(img, []); title("Original Image"); imwrite(img, 'q2_1.jpg');
subplot(1, 3, 2); imshow(log_magnitude, []); title("Log Magnitude of DFT"); imwrite(im2uint8(log_magnitude/20), 'q2_2.jpg');
subplot(1, 3, 3); imshow(reg_img, []);  imwrite(im2uint8(fftshift(reg_img)), 'q2_3.jpg'); title("Regenerated Image");