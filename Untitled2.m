foo = im2double(image_c);
image_Mixed = foo;
[m n l]=size(image_Mixed);
REf = reshape(image_Mixed,[m*n l]);
Accessories;
[XYZ]=ref2XYZ(REf',xyz(1:2:end,:),D65(1:2:end,:));
image_Mixed_nr = xyz2srgb(XYZ);
image_Mixed_nr = reshape(image_Mixed_nr',[m n 3]);
%image_Mixed_n = imnoise(image_Mixed_n,'gaussian',0,0.000001);
figure(2);imshow(image_Mixed_nr,[])
%RGB = uint8(255*RGB);
