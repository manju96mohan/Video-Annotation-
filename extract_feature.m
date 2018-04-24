function fi =extract_feature(im)
addpath('feature_Extraction');
im=imresize(im,[320,240]);
grayim=rgb2gray(im);
[descriptors, locs] = sift(grayim);
sifthist=sift_hist(descriptors)';
colfet=colorMoment(im);
edhist= edgehist(im);
wldf=wavletDescriptor(im);
fi=[colfet;edhist;wldf;sifthist]';
fi(isnan(fi))=0;