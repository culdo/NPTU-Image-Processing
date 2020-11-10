function draw_bias(handles)
global img;
yuv_img = rgb2yuv(img);

Y = get(handles.slider1, 'Value');
U = get(handles.slider2, 'Value');
V = get(handles.slider3, 'Value');
yuv_img(:, :, 1) = yuv_img(:, :, 1) + Y;
yuv_img(:, :, 2) = yuv_img(:, :, 2) + U;
yuv_img(:, :, 3) = yuv_img(:, :, 3) + V;
rgb_img = yuv2rgb(yuv_img);

axes(handles.axes2);
imshow(rgb_img);