org_img = imread('Lenna.png');
% org_img = rgb2gray(org_img);
figure(1);
imshow(org_img);

sobel_kernel_h = [1  2  1
                  0  0  0
                 -1 -2 -1];
             
% sobel_kernel_h = [2  3  4  3  2
%                   1  2  3  2  1
%                   0  0  0  0  0
%                  -1 -2 -3 -2 -1
%                  -2 -3 -4 -3 -2];

% sobel_kernel_h = [3  4  5  6  5  4  3
%                   2  3  4  5  4  3  2
%                   1  2  3  4  3  2  1
%                   0  0  0  0  0  0  0
%                  -1 -2 -3 -4 -3 -2 -1
%                  -2 -3 -4 -5 -4 -3 -2
%                  -3 -4 -5 -6 -5 -4 -3];
             
sobel_kernel_v = sobel_kernel_h.';

N = size(sobel_kernel_h, 1);
margin = (N-1)/2;
[org_h, org_w, img_dim] = size(org_img);

img2_padded = zeros(org_h+N-1, org_w+N-1, img_dim);
img2_padded(1+margin:org_h+margin, 1+margin:org_w+margin, :) = org_img(:, :, :);
result_img = zeros(org_h, org_w, img_dim);

for i=1+margin:size(img2_padded, 1)-margin
    for j=1+margin:size(img2_padded, 2)-margin
        img_shadow = img2_padded(i-margin:i+margin, j-margin:j+margin, :);
        sobel_x = img_shadow .* sobel_kernel_h;
        sobel_y = img_shadow .* sobel_kernel_v;
        vect = vecnorm([sum(sum(sobel_x), 2) sum(sum(sobel_y), 2)]);
        result_img(i-margin, j-margin, :) = vect;
    end
end

figure(2);
result_img = uint8(result_img);
imshow(result_img);