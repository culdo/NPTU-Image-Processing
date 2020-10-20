function draw_bias(handles)
global img;
yuv_img = rgb2hsv(double(img));

H = get(handles.slider1, 'Value');
S = get(handles.slider2, 'Value');
V = get(handles.slider3, 'Value');

H = yuv_img(:, :, 1) + H;
S = yuv_img(:, :, 2) + S;
V = yuv_img(:, :, 3) + V;

yuv_img(:, :, 1) = max(min(H, 1.0), 0);
yuv_img(:, :, 2) = max(min(S, 1.0), 0);
yuv_img(:, :, 3) = max(min(V, 500), 0);

rgb_img = uint8(hsv2rgb(yuv_img));

axes(handles.axes2);
imshow(rgb_img);