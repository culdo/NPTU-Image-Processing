org_img = imread('img1.jpg');
org_img = rgb2gray(org_img);
org_img = imbinarize(org_img, 0.5);
figure(1);
imshow(org_img);

result_img = dilate(org_img, 5);
figure(2);
imshow(result_img);

result_img = erose(org_img, 5);
figure(3);
imshow(result_img);

function result_img = dilate(img, times)
    N = 3;
    margin = (N-1)/2;
    [org_h, org_w] = size(img);

    img2_padded = zeros(org_h+N-1, org_w+N-1);
    img2_padded(1+margin:org_h+margin, 1+margin:org_w+margin) = img(:, :);
    result_img = zeros(org_h, org_w, 'logical');
    for k=1:times
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
        img2_padded = result_img;
    end
    return
end

function result_img = erose(img, times)
    N = 3;
    margin = (N-1)/2;
    
    [org_h, org_w] = size(img);

    img2_padded = zeros(org_h+N-1, org_w+N-1);
    img2_padded(1+margin:org_h+margin, 1+margin:org_w+margin) = img(:, :);
    result_img = zeros(org_h, org_w, 'logical');
    for k=1:times
        for i=1+margin:size(img2_padded, 1)-margin
            for j=1+margin:size(img2_padded, 2)-margin
                img_shadow = img2_padded(i-margin:i+margin, j-margin:j+margin);
                if sum(img_shadow(:)) == N*N
                    result_img(i-margin:i+margin, j-margin:j+margin) = 1;
                else
                    result_img(i-margin:i+margin, j-margin:j+margin) = 0;
                end
            end
        end
        img2_padded = result_img;
    end
    return
end