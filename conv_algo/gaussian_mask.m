org_img = imread('Lenna.png');
figure(1);
imshow(org_img);

N = 9;
margin = (N-1)/2;

kernel = zeros(N, N);
sigma = 1.5;
for i=1:N
    for j=1:N
        x = i - margin - 1;
        y = j - margin - 1;
        kernel(i, j) = exp(-(x^2+y^2)/2*sigma^2) / 2*pi*sigma^2;
    end
end
kernel = kernel/sum(sum(kernel));
kernel

[org_h, org_w, img_dim] = size(org_img);

img2_padded = zeros(org_h+N-1, org_w+N-1, img_dim);
img2_padded(1+margin:org_h+margin, 1+margin:org_w+margin, :) = org_img(:, :, :);
result_img = zeros(org_h, org_w, img_dim);

for i=1+margin:size(img2_padded, 1)-margin
    for j=1+margin:size(img2_padded, 2)-margin
        img_shadow = img2_padded(i-margin:i+margin, j-margin:j+margin, :);
        sharpen = img_shadow .* kernel;
        result_img(i-margin, j-margin, :) = sum(sum(sharpen));
    end
end

figure(2);
result_img = uint8(result_img);
imshow(result_img);
