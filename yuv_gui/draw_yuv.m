function draw_yuv(handles)
Y = get(handles.slider1, 'Value');
U = get(handles.slider2, 'Value');
V = get(handles.slider3, 'Value');
yuv_color = zeros(256, 256, 3);
yuv_color(:, :, 1) = Y;
yuv_color(:, :, 2) = U;
yuv_color(:, :, 3) = V;
axes(handles.axes2)
imshow(yuv2rgb(yuv_color))