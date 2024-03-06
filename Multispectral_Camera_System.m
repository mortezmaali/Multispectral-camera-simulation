Monochrome_Sensitivity
lightSource;
load('MCC.mat')
REF=reshape(image_c,[100*150 31]);
E=D65(:,1:2:61)/100;
Filters
%Normalizing filters spectral transmittance
s=bb(:,5:end-5)/100;
%Multiplying the spectral transmittance of the filters by the spectral
%sensitivity of the monochrome sensor
M_Sn= repmat(M_S(:,2),1,7);
sn=M_Sn'.*s;
%Computing the image output by the multispectral camera system
RMSp=sn*diag(E)*REF';
%Adding some random noise to the images produced by the system
nn = randn(size(RMSp));
RMSp=0.00002*nn+RMSp;
RMSp=reshape(RMSp',[100 150 7]);
set(groot, 'defaultFigureWindowState', 'maximized');
for i = 1:7
    figure(i);imshow(RMSp(:,:,i),[])
end

