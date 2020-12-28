img = imread('cman.pgm');

[ft, log_magnitude, phase_img] = myDFT(img);

subplot(1, 3, 1); imshow(img, []); title("Original Image"); imwrite(img, 'q1_1.jpg');
subplot(1, 3, 2); imshow(fftshift(log_magnitude), []); title("Log Magnitude of DFT"); imwrite(im2uint8(log_magnitude/20), 'q1_2.jpg');
subplot(1, 3, 3); imshow(fftshift(phase_img), []); title("Phase Image"); imwrite(phase_img, 'q1_3.jpg');