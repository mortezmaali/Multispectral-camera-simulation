lightSource; 
ab=load('MeasuredData_reshaped');
REF1=ab.R.sg;
REF=REF1(3:33,:);
E=D65(:,1:2:61);
Filters
s=bb(:,5:end-5);

RGB=s*diag(E)*REF;
nn = randn(size(RGB));
RGB=0.4*nn+RGB;

M=REF*pinv(RGB);

Rtest=Ref(3:end-3,:);

RGBt=s*diag(E)*Rtest;
nn = randn(size(RGBt));
RGBt=0.4*nn+RGBt;

Rr=M*RGBt;

RMS1=mean(sqrt(sum((Rr-Rtest).^2)/31))
MEANDE1 = ColorDifference(Rr,Rtest)
