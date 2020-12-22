img = imread('Picture_1.jpg');

[h, w, dim] = size(img);

color_picked = [20 250 60];
color_range = [100 160 140];

img2 = zeros(size(img), 'uint8');
figure(1);
imshow(img);

for i=1:h
    for j=1:w
        p = double(reshape(img(i, j, :),1,[]));
        if abs(color_picked - p) < color_range
           img(i, j, :) = [0 0 255];
        end
    end
end

figure(2);
imshow(img);

