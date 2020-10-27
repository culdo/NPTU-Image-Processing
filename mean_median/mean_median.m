img = imread('Lenna.png');
figure(1);
imshow(img);

img2 = imnoise(img, "Salt & Pepper", 0.01);
figure(2);
imshow(img2);
N = 3;

for i=1:size(img, 1)
    for j=1:size(img, 2)
        filter = zeros(9, 3);
        filter_x = int((N-1)/2);
        if i > filter_x
            filter(1:filter_x+1) = img(i-filter_x+1, j, :);
        end
        
        if j > filter_x
            filter(1:filter_x+1) = img(i-filter_x+1, j, :);
        end
    end
end