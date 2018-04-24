clear;
clc;
close all;
A = imread([name,path]=uigetfile('*.png'));
imwrite(A,'*.jpg');

