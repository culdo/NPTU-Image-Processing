org_img = imread('img1.jpg');
figure(1);
imshow(org_img);
[res_img, grey] = im2bw(org_img, 0.5);
figure(2);
imshow(grey);
figure(3);
h = histogram(grey(:));
[vs, poses] = sort(h.Values, 'descend');
mid_pose = round(mean([poses(1),poses(2)]));
text(h.BinEdges(poses(1)), vs(mid_pose), "\downarrow Picked threshold");
figure(4);
imshow(res_img);


function [res_img, grey_img] = im2bw(img, level)
    [h, w, ~] = size(img);
    grey_img = zeros(h, w, 'double');
    res_img = zeros(h, w);
    for i=1:h
        for j=1:w
            pix_sum = sum(img(i, j, :));
            grey_img(i, j) = pix_sum/(255*3);
            if pix_sum > 255*3*level
                res_img(i, j) = 1;
            end
        end
    end
    return
end

        
