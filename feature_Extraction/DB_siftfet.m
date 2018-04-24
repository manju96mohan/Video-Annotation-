function total_des=DB_siftfet
current=pwd;
cd ('..\adjective');
data=dir('*.jpg');
cd(current)
total_des=zeros(5000,128);
k=0;
for i=1:length(data)
rgbim=imread(['..\adjective\',data(i).name]);
grayim=rgb2gray(rgbim);
grayim=imresize(grayim,[320,240]);
[descriptors, locs] = sift(grayim);
p=size(locs,1);
total_des(k+1:k+p,:)=descriptors;
k=k+p;
clc;
end

cd ('..\event');
data=dir('*.jpg');
cd(current)

for i=1:length(data)
rgbim=imread(['..\event\',data(i).name]);
grayim=rgb2gray(rgbim);
grayim=imresize(grayim,[320,240]);
[descriptors, locs] = sift(grayim);
p=size(locs,1);
total_des(k+1:k+p,:)=descriptors;
k=k+p;
clc;
end
total_des=total_des(1:k,:);
 
cd ('..\object');
data=dir('*.jpg');
cd(current)

for i=1:length(data)
rgbim=imread(['..\object\',data(i).name]);
grayim=rgb2gray(rgbim);
grayim=imresize(grayim,[320,240]);
[descriptors, locs] = sift(grayim);
p=size(locs,1);
total_des(k+1:k+p,:)=descriptors;
k=k+p;
clc;
end
total_des=total_des(1:k,:);
 
cd ('..\scene');
data=dir('*.jpg');
cd(current)

for i=1:length(data)
rgbim=imread(['..\scene\',data(i).name]);
grayim=rgb2gray(rgbim);
grayim=imresize(grayim,[320,240]);
[descriptors, locs] = sift(grayim);
p=size(locs,1);
total_des(k+1:k+p,:)=descriptors;
k=k+p;
clc;
end
total_des=total_des(1:k,:);
 
