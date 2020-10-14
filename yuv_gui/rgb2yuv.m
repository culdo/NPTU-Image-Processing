function YUV = rgb2yuv(RGB)
R = RGB(:,:,1);
G = RGB(:,:,2);
B = RGB(:,:,3);

Y = 0.299   * R + 0.587   * G + 0.114 * B;
U =-0.168736 * R - 0.331264 * G + 0.5 * B + 128;
V = 0.5 * R - 0.418688 * G - 0.081312 * B + 128;
YUV=uint8(cat(3,Y,U,V));


