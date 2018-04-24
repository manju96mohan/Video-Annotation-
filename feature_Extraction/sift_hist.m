function sifthist=sift_hist(descriptors)
load visualword;
num=zeros(1,size(descriptors,1));
for i = 1 : size(descriptors,1)
    D=dist(C,descriptors(i,:)');
    [vals,indx]=sort(D);
    num(i)=indx(1);
end
sifthist=histc(num,1:K);