function yuv = rgb2yuv(RGB)
yuv = dot(RGB,[0.299 -0.168 0.500; 0.587 -0.331 -0.418; 0.114 0.500 -0.081]);
