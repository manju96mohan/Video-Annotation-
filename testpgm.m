function X=testpgm
addpath('feature_Extraction');
%%
[name,path]=uigetfile('*.mp4');
if(path==0)
    return;
end
v=VideoReader(fullfile(path,name)); 
n=v.NumberOfFrames;
for i=1:90
    frame{i,:}=read(v,i);
end
delete(v);
clear v;
%%
%create clusters
for j=1:90/10
    It(j,:)=frame((j-1)*10+1:j*10)';
end
%%
load db
% C=cell2mat(c');
% len_a =size(c{1,1},1);
% len_e =size(c{1,2},1);
% len_o =size(c{1,3},1);
% len_s =size(c{1,4},1);
% M=[ones(1,len_a),2*ones(1,len_e),3*ones(1,len_o),4*ones(1,len_s)];

a=c{1,1};
e=c{1,2};
o=c{1,3};
s=c{1,4};
%%
wb = waitbar(0,'Loading......');
for cluster=1
    for j=1:10
waitbar(j/10); 
Ii=It{1,j};
R=10;
fi =extract_feature(Ii);
Da=dist(a,fi');
[sortv,sindx]=sort(Da);
indx=sindx(1:R);
CEa(j,:)=atags(indx);

De=dist(e,fi');
[sortv,sindx]=sort(De);
indx=sindx(1:R);
CEe(j,:)=etags(indx);

Do=dist(o,fi');
[sortv,sindx]=sort(Do);
indx=sindx(1:R);
CEo(j,:)=otags(indx);

Ds=dist(s,fi');
[sortv,sindx]=sort(Ds);
indx=sindx(1:R);
CEs(j,:)=stags(indx);
% best element selection

    end
end
close(wb);
%%
[W, ~, J]=unique(CEa);
C=histc(J, 1:numel(W));
for i=1:numel(W);
    w=W{i};
    wg=zeros(1,10);
for k=2:10-1
   ta=CEa(k,:);
   ta1=CEa(k-1,:);
   ta2=CEa(k+1,:);
   if ~isempty(strfind(ta,w))
       wg(k)=1;
   elseif ~isempty(strfind(ta1,w)) || ~isempty(strfind(ta2,w))
       wg(k)=0.8;
   else
       wg(g)=0.5;
   end
   
end
  score(i)=sum(wg)*C(i);
end
[maxv,indx]=max(score);
wca=W{indx};

[W, ~, J]=unique(CEo);
C=histc(J, 1:numel(W));
for i=1:numel(W);
    w=W{i};
for k=2:10-1
   ta=CEo(k,:);
   ta1=CEo(k-1,:);
   ta2=CEo(k+1,:);
   if ~isempty(strfind(ta,w))
       wg(k)=1;
   elseif ~isempty(strfind(ta1,w)) || ~isempty(strfind(ta2,w))
       wg(k)=0.8;
   else
       wg(g)=0.5;
   end
   
end
  score(i)=sum(wg)*C(i);
end
[maxv,indx]=max(score);
wco=W{indx};


[W, ~, J]=unique(CEe);
C=histc(J, 1:numel(W));
for i=1:numel(W);
    w=W{i};
for k=2:10-1
   ta=CEe(k,:);
   ta1=CEe(k-1,:);
   ta2=CEe(k+1,:);
   if ~isempty(strfind(ta,w))
       wg(k)=1;
   elseif ~isempty(strfind(ta1,w)) || ~isempty(strfind(ta2,w))
       wg(k)=0.8;
   else
       wg(g)=0.5;
   end
   
end
  score(i)=sum(wg)*C(i);
end
[maxv,indx]=max(score);
wce=W{indx};

[W, ~, J]=unique(CEs);
C=histc(J, 1:numel(W));
for i=1:numel(W);
    w=W{i};
for k=2:10-1
   ta=CEs(k,:);
   ta1=CEs(k-1,:);
   ta2=CEs(k+1,:);
   if ~isempty(strfind(ta,w))
       wg(k)=1;
   elseif ~isempty(strfind(ta1,w)) || ~isempty(strfind(ta2,w))
       wg(k)=0.8;
   else
       wg(g)=0.5;
   end
   
end
  score(i)=sum(wg)*C(i);
end
[maxv,indx]=max(score);
wcs=W{indx};

joint=' in ';
if(strcmp(wcs,'sunset')==1||strcmp(wcs,'seashore')==1||strcmp(wcs,'beach')==1||strcmp(wcs,'ocean')==1)
joint=' in the ';
end
if(strcmp(wcs,'car')==1||strcmp(wcs,'table')==1||strcmp(wcs,'branch')==1||strcmp(wcs,'tree')==1)
joint=' on the ';
end
X = [wco,' ', wce , joint , ' ',wca ' ', wcs];
disp(X); 


