%Code by Lin Chen 
%Summary
%   The function is to convert XYZ tristimulus values to images.
%[IN]
%   a 3-by-n matrix of XYZ trisimulus values 
%[OUT]
%   a 3-by-n matrix of sRGB values 
function sRGB=xyz2srgb(XYZ)
XYZ=XYZ/100;
M=inv([0.4124,0.3576,0.1805;0.2126,0.7152,0.0722;0.0193,0.1192,0.9505]);

% M=[3.2410,-1.5374,-0.4986;...
%   -0.9692,1.8760,0.0416;...
%   0.0556,-0.2040,1.0570];

sRGB=M*XYZ;
sRGB(sRGB>1)=1;
sRGB(sRGB<0)=0;

idx1=find(sRGB<=0.0031308);
idx2=find(sRGB>0.0031308);
sRGB(idx1)=12.92*sRGB(idx1);

a=0.055;
sRGB(idx2)=(1+a)*sRGB(idx2).^(1/2.4)-a;

end