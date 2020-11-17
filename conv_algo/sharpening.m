org_img = imread('Lenna.png');
figure(1);
imshow(org_img);

N = 3;
margin = (N-1)/2;
img_dim = 3;
% sharpen parameter
a = 2;

img2_padded = zeros(size(org_img, 1)+N-1, size(org_img, 2)+N-1, img_dim);
img2_padded(1+margin:size(org_img, 1)+margin, 1+margin:size(org_img, 2)+margin, :) = org_img(:, :, :);
result_img = zeros(size(org_img, 1), size(org_img, 2), img_dim);

for i=1+margin:size(img2_padded, 1)-margin
    for j=1+margin:size(img2_padded, 2)-margin
        img_shadow = img2_padded(i-margin:i+margin, j-margin:j+margin, :);
        sharpen = img_shadow .* [0 -a 0; -a (4*a+1) -a; 0 -a 0;];
        result_img(i-margin, j-margin, :) = sum(sum(sharpen));
    end
end

figure(2);
result_img = uint8(result_img);
imshow(result_img);