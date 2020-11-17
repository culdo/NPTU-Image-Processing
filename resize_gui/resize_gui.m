
img = imread('Lenna.png');
figure(1);
imshow(img);

jump_x = 2;
jump_y = 2;

simalier = zeros([round(size(img, 1)/jump_x), round(size(img, 2)/jump_y), 3], 'uint8');
big_x = round(size(img, 1)*jump_x);
big_y =  round(size(img, 2)*jump_y);
bigger = zeros([big_x, big_y, 3], 'uint8');
f = figure(2);
for i=1:size(img,1)
    for j=1:size(img,2)
        if mod(i,jump_x)==0 & mod(j,jump_y)==0
            simalier(i/jump_x, j/jump_y, :) = img(i, j, :);
        end
    end
end

for i=1:size(img,1)
    for j=1:size(img,2)
        inter_val_x = 0;
        inter_val_y = 0;
        if i > 1 & j > 1
            diff_x = img(i, j, :) - img(i-1, j, :);
            inter_val_x = diff_x / jump_x;
            diff_y = img(i, j, :) - img(i, j-1, :);
            inter_val_y = diff_y / jump_y;
        end
        for k=1:jump_x
            for m=1:jump_y
               bigger((i-1)*jump_x+k, (j-1)*jump_y+m, :) = img(i, j, :) + (inter_val_x * k-1) + (inter_val_y * m-1);
            end
        end
    end
end

figure(2);
imshow(simalier);

figure(3);
imshow(bigger);