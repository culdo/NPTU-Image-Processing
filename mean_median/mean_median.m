img = imread('Lenna.png');
figure(1);
imshow(img);

img2 = imnoise(img, "Salt & Pepper", 0.01);
figure(2);
imshow(img2);
N = 3;
margin = (N-1)/2;
result_img = zeros(size(img, 1)-N-1, size(img, 2)-N-1, 3);

for i=1+margin:size(img, 1)-margin
    for j=1+margin:size(img, 2)-margin
        img_shadow = img2(i-margin:i+margin, j-margin:j+margin, :);
        img_shadow = reshape(img_shadow, N*N, 3);
        result_img(i-margin, j-margin, :) = median(img_shadow, 1);
    end
end

figure(3);
result_img = uint8(result_img);
imshow(result_img);