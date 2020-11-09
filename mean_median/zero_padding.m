clc;
clear all;

org_img = imread('Lenna.png');
figure(1);
imshow(org_img);

noise_img = imnoise(org_img, "Salt & Pepper", 0.01);
figure(2);
imshow(noise_img);
N = 3;
margin = (N-1)/2;
img2_padded = zeros(size(org_img, 1)+N-1, size(org_img, 2)+N-1, 3);
img2_padded(1+margin:size(org_img, 1)+margin, 1+margin:size(org_img, 2)+margin, :) = noise_img(:, :, :);
result_img = zeros(size(org_img, 1), size(org_img, 2), 3);

for i=1+margin:size(img2_padded, 1)-margin
    for j=1+margin:size(img2_padded, 2)-margin
        img_shadow = img2_padded(i-margin:i+margin, j-margin:j+margin, :);
        img_shadow = reshape(img_shadow, N*N, 3);
        result_img(i-margin, j-margin, :) = median(img_shadow, 1);
    end
end

figure(3);
result_img = uint8(result_img);
imshow(result_img);

a = 1;
b = 5;
r = round((b-a).*rand(b,1) + a);
imgs = {org_img, result_img};
figure(4);
diff = immse(imgs{1}, imgs{2});
psnr = 20 * log10(255) - 10*log10(diff);
fprintf('MSE=%.2f\n', diff);
fprintf('PSNR=%.2f', psnr);
for i=1:2
    img = imgs{i};
    subplot(3, 2, i);
    plot(img(:, r, 1));
    title("R");
    subplot(3, 2, i+2);
    plot(img(:, r, 2));
    title("G");
    subplot(3, 2, i+4);
    plot(img(:, r, 3));
    title("B");
end
        