org_img = imread('Lenna.png');
org_img = rgb2gray(org_img);
figure(1);
imshow(org_img);

N = 3;
margin = (N-1)/2;
img_dim = 1;

img2_padded = zeros(size(org_img, 1)+N-1, size(org_img, 2)+N-1, img_dim);
img2_padded(1+margin:size(org_img, 1)+margin, 1+margin:size(org_img, 2)+margin, :) = org_img(:, :, :);
result_img = zeros(size(org_img, 1), size(org_img, 2), img_dim);

for i=1+margin:size(img2_padded, 1)-margin
    for j=1+margin:size(img2_padded, 2)-margin
        img_shadow = img2_padded(i-margin:i+margin, j-margin:j+margin, :);
        sobel_x = img_shadow .* [1 0 -1;2 0 -2; 1  0 -1];
        sobel_y = img_shadow .* [1 2  1;0 0  0;-1 -2 -1];
        vect = norm(sum(sum(sobel_x)), sum(sum(sobel_y)));
        result_img(i-margin, j-margin, :) = vect;
    end
end

figure(2);
result_img = uint8(result_img);
imshow(result_img);