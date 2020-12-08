org_img = imread('img3.jpg');
org_img = rgb2gray(org_img);
org_img = imbinarize(org_img, 0.5);
figure(1);
imshow(org_img);

global N margin;
N = 3;
margin = (N-1)/2;

result_img = opening(org_img, 5, 1);
figure(2);
imshow(result_img);

result_img = closing(org_img, 6, 8);
figure(3);
imshow(result_img);

lenna = imread('Lenna.png');
[l_h, l_w, l_dim] = size(lenna);

h = min(size(result_img, 1), l_h);
w = min(size(result_img, 2), l_w);
bias_h = (max(size(result_img, 1), l_h) - h)/2;
bias_w = (max(size(result_img, 2), l_w) - w)/2;
if size(result_img, 1) > l_h
    bias_h = -bias_h;
end
if size(result_img, 2) > l_w
    bias_w = -bias_w;
end

result_img = ind2rgb(result_img , 'gray');
for i=1:size(result_img, 1)
    for j=1:size(result_img, 2)
        if result_img(i, j) && size(lenna, 1) > i+bias_h > 0 && size(lenna, 2) > j+bias_w > 0
            result_img(i, j, :) = lenna(i+bias_h, j+bias_w, :);
        end
    end
end

figure(4);
imshow(result_img);

function result_img = opening(img, times1, times2)
    result_img = erose(img, times1);
    result_img = dilate(result_img, times2);
    return
end


function result_img = closing(img, times1, times2)
    result_img = dilate(img, times1);
    result_img = erose(result_img, times2);
    return
end

function result_img = dilate(img, times)
    global N;
    global margin;
    [org_h, org_w] = size(img);

    result_img = zeros(org_h, org_w, 'logical');
    for k=1:times
        for i=1+margin:size(img, 1)-margin
            for j=1+margin:size(img, 2)-margin
                img_shadow = img(i-margin:i+margin, j-margin:j+margin);
                if sum(img_shadow(:)) > 0
                    result_img(i-margin:i+margin, j-margin:j+margin) = 1;
                else
                    result_img(i-margin:i+margin, j-margin:j+margin) = 0;
                end
            end
        end
        img = result_img;
    end
    return
end

function result_img = erose(img, times)
    global N;
    global margin;
    [org_h, org_w] = size(img);

    result_img = zeros(org_h, org_w, 'logical');
    for k=1:times
        for i=1+margin:size(img, 1)-margin
            for j=1+margin:size(img, 2)-margin
                img_shadow = img(i-margin:i+margin, j-margin:j+margin);
                if sum(img_shadow(:)) == N*N
                    result_img(i-margin:i+margin, j-margin:j+margin) = 1;
                else
                    result_img(i-margin:i+margin, j-margin:j+margin) = 0;
                end
            end
        end
        img = result_img;
    end
    return
end