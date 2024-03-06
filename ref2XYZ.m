%Chen Lin
%Summary
%   The function is to calculate XYZ from reflectance.
%[IN]
%   cmf: color matching function. m-by-3
%   ill: illuminant. m-by-1
%   ref: reflectance m-by-n.  m: wavelength, n: number of reflectance
%[OUT]
%   XYZ: 3-by-n
function[XYZ]=ref2XYZ(ref,cmf,ill)
%the illuminant normalization constant k
K=100/(ill'*cmf(:,2));
%the transpose of the cmf, a diagonal matrix of the ill and the ref
XYZ=K*cmf'*diag(ill)*ref;
end
