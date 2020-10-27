
img = imread('Lenna.png');
figure(1);
imshow(img);

jump_x = 5;
jump_y = 2;

roted = zeros([round(size(img, 1)/jump_x), round(size(img, 2)/jump_y), 3], 'uint8');

f = figure(2);
for i=1:size(img,1)
    for j=1:size(img,2)
        if mod(i,jump_x)==0 & mod(j,jump_y)==0
            roted(i/jump_x, j/jump_y, :) = img(i, j, :);
        end
    end
end

figure(2);
imshow(roted);