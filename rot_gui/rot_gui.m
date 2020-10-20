
img = imread('Lenna.png');
f = figure(1);
imshow(img);

ang = -30;
ang = ang * (pi/180);

roted = zeros(size(img), 'uint8');
roted1 = zeros(size(img), 'uint8');
rot_mat = [cos(ang) -sin(ang); sin(ang) cos(ang);];
f = figure(2);
for i=1:size(img,1)
    for j=1:size(img,2)
        new_pos = round(rot_mat * [j; i]);
        if size(img, 2) > new_pos(1) & new_pos(1) > 0 & size(img, 1) > new_pos(2) & new_pos(2) > 0
            roted1(new_pos(2), new_pos(1), :) = img(i, j, :);
            roted(i, j, :) = img(new_pos(2), new_pos(1), :);
        end
    end
end

imshow(roted);

figure(3)
imshow(roted1)