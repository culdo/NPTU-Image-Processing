org_img = imread('img2.jpg');
org_img = imbinarize(org_img, 0.5);
figure(1);
imshow(org_img);

N = 3;
margin = (N-1)/2;

[org_h, org_w] = size(org_img);

img2_padded = zeros(org_h+N-1, org_w+N-1);
img2_padded(1+margin:org_h+margin, 1+margin:org_w+margin) = org_img(:, :);
result_img = zeros(org_h, org_w, 'logical');

for i=1+margin:size(img2_padded, 1)-margin
    for j=1+margin:size(img2_padded, 2)-margin
        img_shadow = img2_padded(i-margin:i+margin, j-margin:j+margin);
        if sum(img_shadow(:)) > 0
            result_img(i-margin:i+margin, j-margin:j+margin) = 1;
        else
            result_img(i-margin:i+margin, j-margin:j+margin) = 0;
        end
    end
end

figure(2);
imshow(result_img);