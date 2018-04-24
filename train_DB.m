clear;
clc;
close all;
addpath('feature_Extraction');
%%
current=pwd;
cd ('.\adjective');
data=dir('*.jpg');
cd(current)

filename = 'adjective_tags.txt';
delimiter = '\t';
formatSpec = '%s%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true,  'ReturnOnError', false);
fclose(fileID);
names=dataArray{1,1};
Tag = dataArray{1,2};
for i=1:length(data)
    j=i;
rgbim=imread(['.\adjective\',data(i).name]);
name=strtok(data(i).name,'.');
f=strcmpi(names,name);
f1=cell2mat(names(f));
if ~isempty(f1);
a(j,:)=extract_feature(rgbim);
t1=Tag(f);
atags(j)=t1(1);
else
    j=i-1;
end
end
%%


cd ('.\event');
data=dir('*.jpg');
cd(current)

filename = 'event_tags.txt';
delimiter = '\t';
formatSpec = '%s%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true,  'ReturnOnError', false);
fclose(fileID);
names=dataArray{1,1};
Tag = dataArray{1,2};
for i=1:length(data)
    j=i;
rgbim=imread(['.\event\',data(i).name]);
name=strtok(data(i).name,'.');
f=strcmpi(names,name);
f1=cell2mat(names(f));
if ~isempty(f1);
e(j,:)=extract_feature(rgbim);
t1=Tag(f);
etags(j)=t1(1);
else
   j=i-1;
end
end

cd ('.\object');
data=dir('*.jpg');
cd(current)

filename = 'object_tags.txt';
delimiter = '\t';
formatSpec = '%s%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true,  'ReturnOnError', false);
fclose(fileID);
names=dataArray{1,1};
Tag = dataArray{1,2};
for i=1:length(data)
    j=i;
rgbim=imread(['.\object\',data(i).name]);
name=strtok(data(i).name,'.');
f=strcmpi(names,name);
f1=cell2mat(names(f));
if ~isempty(f1);
o(j,:)=extract_feature(rgbim);
t1=Tag(f);
otags(j)=t1(1);
else
    j=i-1;
end
end
%%
cd ('.\scene');
data=dir('*.jpg');
cd(current)

filename = 'scene_tags.txt';
delimiter = '\t';
formatSpec = '%s%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true,  'ReturnOnError', false);
fclose(fileID);
names=dataArray{1,1};
Tag = dataArray{1,2};
for i=1:length(data)
    j=i;
rgbim=imread(['.\scene\',data(i).name]);
name=strtok(data(i).name,'.');
f=strcmpi(names,name);
f1=cell2mat(names(f));
if ~isempty(f1);
s(j,:)=extract_feature(rgbim);
t1=Tag(f);
stags(j)=t1(1);
else
    j=i-1;
end
end

c{1,1}=a;
c{1,2}=e;
c{1,3}=o;
c{1,4}=s;

save db c atags otags etags stags