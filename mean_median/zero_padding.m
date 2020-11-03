clc;
clear all;

img = imread('Lenna.png');
figure(1);
imshow(img);

img2 = imnoise(img, "Salt & Pepper", 0.01);
figure(2);
imshow(img2);
N = 3;
margin = (N-1)/2;
img2_padded = zeros(size(img, 1)+N-1, size(img, 2)+N-1, 3);
img2_padded(1+margin:size(img, 1)+margin, 1+margin:size(img, 2)+margin, :) = img2(:, :, :);
result_img = zeros(size(img, 1), size(img, 2), 3);

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
imgs = {img2_padded, result_img};
figure(4);
diff = immse(img{1},img{2});
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
        