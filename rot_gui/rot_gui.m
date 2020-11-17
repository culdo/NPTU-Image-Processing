
img = imread('Lenna.png');
figure(1);
imshow(img);

ang = 50;
ang = ang * (pi/180);
rot_mat = [cos(ang) -sin(ang); sin(ang) cos(ang);];

roted = zeros(size(img), 'uint8');
roted1 = zeros(size(img), 'uint8');

figure(2);
for i=1:size(img, 1)
    for j=1:size(img, 2)
        new_pos = round([i j] * rot_mat);
        if size(img, 2) > new_pos(2) && new_pos(2) > 0 && size(img, 1) > new_pos(1) && new_pos(1) > 0
            roted1(new_pos(1), new_pos(2), :) = img(i, j, :);
            roted(i, j, :) = img(new_pos(1), new_pos(2), :);
        end
    end
end
imshow(roted);

figure(3);
imshow(roted1);

upper_right = round([1, size(img, 2)] * rot_mat);
lower_left = round([size(img, 1), 1] * rot_mat);
lower_right = round([size(img, 1), size(img, 2)] * rot_mat);
hs = [upper_right(1) lower_left(1) lower_right(1) 0];
ws = [upper_right(2) lower_left(2) lower_right(2) 0];
shift_h = min(hs);
shift_w = min(ws);
rot_h = max(hs) - shift_h;
rot_w = max(ws) - shift_w;
shifted = zeros(rot_w, rot_h, 3, 'uint8');

for i=1:rot_h
    for j=1:rot_w
        new_pos = round([i+shift_w j+shift_h] * rot_mat);
        if size(img, 2) > new_pos(2) && new_pos(2) > 0 && size(img, 1) > new_pos(1) && new_pos(1) > 0
            shifted(i, j, :) = img(new_pos(1), new_pos(2), :);
        end
    end
end
figure(4)
imshow(shifted);