img = imread('dt.jpg');

[h, w, dim] = size(img);

color_picked = [160 127 90];
color_range = [30 30 30];

img2 = zeros([size(img, 1), size(img, 2), 1], 'logical');
figure(1);
imshow(img);

for i=1:h
    for j=1:w
        p = double(reshape(img(i, j, :),1,[]));
        if abs(color_picked - p) < color_range
           img2(i, j, :) = 1;
        end
    end
end

figure(2);
imshow(img2);

SE = strel('square',5);

result_img = imopen(img2, SE);
result_img = imopen(result_img, SE);
figure(3);
imshow(result_img);

