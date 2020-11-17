function RGB = yuv2rgb(YUV)
YUV=double(YUV);
Y = YUV(:,:,1);
U = YUV(:,:,2);
V = YUV(:,:,3);

R = Y + 1.13983 * (V-128);
G = Y - 0.39465 * (U-128) - 0.58060 * (V-128);
B = Y + 2.03211 * (U-128);
RGB=min(max(cat(3,R,G,B), 0), 255);
RGB= uint8(RGB);
