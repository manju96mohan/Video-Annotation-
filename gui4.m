clear;
clc;
close all;
[name,path]=uigetfile('*.mp4');
v = VideoReader(fullfile(path,name));
i = 1;
while i<=1000
    frame = read(v,i);
    imwrite(frame,['video/',num2str(i),'.jpg']);
    i = i+1;
end
