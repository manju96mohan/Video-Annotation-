function varargout = gui3(varargin)
% GUI3 MATLAB code for gui3.fig
%      GUI3, by itself, creates a new GUI3 or raises the existing
%      singleton*.
%
%      H = GUI3 returns the handle to a new GUI3 or the handle to
%      the existing singleton*.
%
%      GUI3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI3.M with the given input arguments.
%
%      GUI3('Property','Value',...) creates a new GUI3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui3

% Last Modified by GUIDE v2.5 17-Feb-2018 20:51:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui3_OpeningFcn, ...
                   'gui_OutputFcn',  @gui3_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui3 is made visible.
function gui3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui3 (see VARARGIN)
  global k;
  global path;
  global name;
  global rekey;
  global pass;
  rekey=[];
  pass=[];
  k=[];
%   set(handles.afterlogin,'visible','off');
%   set(handles.signuppanel,'visible','off');
 
   h=axes('unit','normalize','position',[0 0 1 1]);
  im=imread('back.jpg');
  imagesc(im);
  set(h,'handlevisibility','off','visible','off');
  uistack(handles.afterlogin,'top');
  set(handles.st1,'String','');
%   pos=get(handles.text1,'position');
%   b=getframe(h,pos);
%   set(handles.text1,'CData',b.cdata);
% Choose default command line output for gui3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui3 wait for user response (see UIRESUME)
% uiwait(handles.fig1);


% --- Outputs from this function are returned to the command line.
function varargout = gui3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
function et1_Callback(hObject, eventdata, handles)
% hObject    handle to et1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et1 as text
%        str2double(get(hObject,'String')) returns contents of et1 as a double


% --- Executes during object creation, after setting all properties.
function et1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function et2_Callback(hObject, eventdata, handles)
% hObject    handle to et2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et2 as text
%        str2double(get(hObject,'String')) returns contents of et2 as a double


% --- Executes during object creation, after setting all properties.
function et2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in p1.
function p1_Callback(hObject, eventdata, handles)
% hObject    handle to p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.st1,'String','');
a=get(handles.et1,'String');
load DBUSER;
j=0;
n=length(vduser);
global k;
for i=1:n
    name=vduser(i).name;
    p=vduser(i).password;
    password=decryptpass(p);
 if(strcmp(a,name)==1) && (strcmp(k,password)==1)
    set(handles.et1,'String','');
    set(handles.et2,'String','');
    set(handles.st1,'ForegroundColor','green');
    set(handles.st1,'String','LOGIN SUCCESSFUL');
    set(handles.afterlogin,'visible','on');
    set(handles.loginpanel,'visible','off');
    j=1;
    break;
 end
end
 if(j==0)
    set(handles.et1,'String','');
    set(handles.et2,'String','');
    set(handles.st1,'ForegroundColor','red');
    set(handles.st1,'String','LOGIN UNSUCCESSFUL');
 end
k=[];


% --- Executes on key press with focus on et2 and none of its controls.
function et2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to et2 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

global k;
key=get(gcf,'currentkey');
NET.addAssembly('PresentationCore');
akey = System.Windows.Input.Key.A;
keys = System.Enum.GetValues(akey.GetType);  %get all members of enumeration
keynames = cell(System.Enum.GetNames(akey.GetType))';
caps = System.Windows.Input.Keyboard.IsKeyToggled(keys(11));
iskeydown = System.Windows.Input.Keyboard.IsKeyDown(keys(11));

if(caps==1)
  k=[k,upper(get(gcf,'currentkey'))];
else
  k=[k,get(gcf,'currentkey')];
end
as(1:length(k))='*';
%set(handles.et2,'String',as);
if(strcmpi(key,'backspace'))
    l=length(k);
    b=l-9;
    if(~isempty(k)&& l>9)
        k(b:end)=[];
        as(b:end)=[];
    elseif l==9
         k=[];
         as=[];
    end    
elseif(strcmp(key,'escape')||strcmp(key,'delete'))
          k=[];
         as=[];  
elseif(strcmpi(key,'return'))
    load DBUSER;
    j=0;
    n=length(vduser);
    l=length(k);
    b=l-(length('return')-1);
    if(~isempty(k)&& l>6)
        k(b:end)=[];
        as(b:end)=[];
    elseif l==6
         k=[];
         as=[];
    end    
   a=get(handles.et1,'String');
   for i=1:n
     name=vduser(i).name;
     p=vduser(i).password;
     pass=decryptpass(p);
     if(strcmp(a,name)==1) && (strcmp(k,pass)==1)
        j=1;
       set(handles.et1,'String','');
       set(handles.st1,'ForegroundColor','green');
       set(handles.st1,'String','LOGIN SUCCESSFUL');
       set(handles.afterlogin,'visible','on');
       set(handles.loginpanel,'visible','off');
       set(handles.et2,'String','');
       k=[];
       as=[];
    end
  end
   if(j==0)
     set(handles.et1,'String','');
     set(handles.st1,'ForegroundColor','red');
     set(handles.st1,'String','LOGIN UNSUCCESSFUL');
     set(handles.et2,'String','');
     as=[];
     k=[];
   end  
elseif(strcmpi(key,'capslock'))
    l=length(k);
    b=l-(length('capslock')-1);
    if(~isempty(k)&& l>8)
        k(b:end)=[];
        as(b:end)=[]; 
    elseif l==8
         k=[];
         as=[];
    end   
end
set(handles.et2,'String',as);



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on p1 and none of its controls.
function p1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to p1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function videoname_Callback(hObject, eventdata, handles)
% hObject    handle to videoname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of videoname as text
%        str2double(get(hObject,'String')) returns contents of videoname as a double


% --- Executes during object creation, after setting all properties.
function videoname_CreateFcn(hObject, eventdata, handles)
% hObject    handle to videoname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pprocess.
function pprocess_Callback(hObject, eventdata, handles)
% hObject    handle to pprocess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%vidname=get(handles.videoname,'String');
global path name;
if path==0
    msgbox('Video not found');
    return;
end
v=VideoReader(fullfile(path,name)); 
n=v.NumberOfFrames;
for i=1:n
    frame=read(v,i);
    imshow(frame,'parent',handles.axes3);
    drawnow;
    %pause(0.1);
end
delete(v);
clear v;


% --- Executes on button press in plogout.
function plogout_Callback(hObject, eventdata, handles)
% hObject    handle to plogout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.getstarted,'visible','on');
set(handles.st1,'String','');
set(handles.afterlogin,'visible','off');

% --- Executes on button press in signup.
function signup_Callback(hObject, eventdata, handles)
% hObject    handle to signup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.signuppanel,'visible','on');
set(handles.loginpanel,'visible','off');



function dbname_Callback(hObject, eventdata, handles)
% hObject    handle to dbname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dbname as text
%        str2double(get(hObject,'String')) returns contents of dbname as a double


% --- Executes during object creation, after setting all properties.
function dbname_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dbname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dbpass_Callback(hObject, eventdata, handles)
% hObject    handle to dbpass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dbpass as text
%        str2double(get(hObject,'String')) returns contents of dbpass as a double


% --- Executes during object creation, after setting all properties.
function dbpass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dbpass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on dbpass and none of its controls.
function dbpass_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to dbpass (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global pass;
global c;
key=get(gcf,'currentkey');
NET.addAssembly('PresentationCore');
akey = System.Windows.Input.Key.A;
keys = System.Enum.GetValues(akey.GetType);  %get all members of enumeration
keynames = cell(System.Enum.GetNames(akey.GetType))';
caps = System.Windows.Input.Keyboard.IsKeyToggled(keys(11));
iskeydown = System.Windows.Input.Keyboard.IsKeyDown(keys(11));
if(caps==1)
  pass=[pass,upper(get(gcf,'currentkey'))];
else
  pass=[pass,get(gcf,'currentkey')];
end
as(1:length(pass))='*';
%set(handles.et2,'String',as);
if(strcmpi(key,'backspace'))
    l=length(pass);
    b=l-9;
    if(~isempty(pass)&& l>9)
        pass(b:end)=[];
        as(b:end)=[];
    elseif l==9
         pass=[];
         as=[];
    end    
elseif(strcmpi(key,'escape')||strcmpi(key,'delete'))
          pass=[];
         as=[];  
elseif(strcmpi(key,'return'))
    l=length(pass);
    b=l-(length('return')-1);
    if(~isempty(pass)&& l>6)
        pass(b:end)=[];
        as(b:end)=[];
    elseif l==6
         pass=[];
         as=[];
    end
  elseif(strcmpi(key,'capslock'))
      c=c+1;
      l=length(pass);
     b=l-(length('capslock')-1);
     if(~isempty(pass)&& l>8)
        pass(b:end)=[];
        as(b:end)=[];
    elseif l==8
         pass=[];
         as=[];
    end   

end
set(handles.dbpass,'String',as);




function repass_Callback(hObject, eventdata, handles)
% hObject    handle to repass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of repass as text
%        str2double(get(hObject,'String')) returns contents of repass as a double


% --- Executes during object creation, after setting all properties.
function repass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to repass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in sign.
function sign_Callback(hObject, eventdata, handles)
% hObject    handle to sign (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pass rekey;
load DBUSER
 n=length(vduser);
if(strcmpi(pass,rekey)==1)
       vduser(n+1).name= get(handles.dbname,'String');
        pass1=encryptpass(pass);
        vduser(n+1).password=pass1;
        save DBUSER  vduser ;
        %msgbox('Account created');
        pause(1);
        set(handles.afterlogin,'visible','on');
        set(handles.signuppanel,'visible','off');
else
     if(isempty(pass)||isempty(rekey))
         msgbox('All fields are required field');
         return
     end    
     msgbox('Passwords do not match');
end
    pass=[];
    rekey=[];
    



% --- Executes on key press with focus on repass and none of its controls.
function repass_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to repass (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global rekey;
global pass;
key=get(gcf,'currentkey');
NET.addAssembly('PresentationCore');
akey = System.Windows.Input.Key.A;
keys = System.Enum.GetValues(akey.GetType);  %get all members of enumeration
keynames = cell(System.Enum.GetNames(akey.GetType))';
caps = System.Windows.Input.Keyboard.IsKeyToggled(keys(11));
iskeydown = System.Windows.Input.Keyboard.IsKeyDown(keys(11));
global c;
if(caps==1)
  rekey=[rekey,upper(get(gcf,'currentkey'))];
else
  rekey=[rekey,get(gcf,'currentkey')];
end
  as(1:length(rekey))='*';
  %set(handles.et2,'String',as);
  if(strcmpi(key,'backspace'))
    l=length(rekey);
    b=l-9;
    if(~isempty(rekey)&& l>9)
        rekey(b:end)=[];
        as(b:end)=[];
    elseif l==9
         rekey=[];
         as=[];
    end    
elseif(strcmpi(key,'escape')||strcmpi(key,'delete'))
          rekey=[];
         as=[];  
elseif(strcmpi(key,'return'))
    load DBUSER;
    n=length(vduser);
    l=length(rekey);
    b=l-(length('return')-1);
    if(~isempty(rekey)&& l>6)
        rekey(b:end)=[];
        as(b:end)=[];
    elseif l==6
         rekey=[];
         as=[];
    end      
    if(strcmpi(pass,rekey)==1)
       vduser(n+1).name= get(handles.dbname,'String');
        pass1=encryptpass(pass);
        vduser(n+1).password=pass1;
        save DBUSER  vduser ;
        %msgbox('Account created');
        pause(1);
        set(handles.afterlogin,'visible','on');
        set(handles.signuppanel,'visible','off');
        pass=[];
        rekey=[];
    else
        msgbox('Passwords do not match');
        pass=[];
        rekey=[];
    end
 elseif(strcmpi(key,'capslock'))
    c=c+1;
    l=length(rekey);
    b=l-(length('capslock')-1);
    if(~isempty(rekey)&& l>8)
        rekey(b:end)=[];
        as(b:end)=[];
    elseif l==8
         rekey=[];
         as=[];
    end   
   
end    
set(handles.repass,'String',as);


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global path name;
[name,path]=uigetfile('*.mp4');
if path==0
    return
end    
set(handles.videoname,'ForeGroundColor','black');
set(handles.videoname,'String',name);


% --- Executes on button press in getstart.
function getstart_Callback(hObject, eventdata, handles)
% hObject    handle to getstart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.loginpanel,'visible','on');
set(handles.getstarted,'visible','off');


% --- Executes on button press in annotate.
function annotate_Callback(hObject, eventdata, handles)
% hObject    handle to annotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.annotationpanel,'visible','on');
set(handles.afterlogin,'visible','off');


% --- Executes on button press in brannotate.
function brannotate_Callback(hObject, eventdata, handles)
% hObject    handle to brannotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

X=testpgm;

set(handles.sentence,'String',X);

% --- Executes on button press in logout1.
function logout1_Callback(hObject, eventdata, handles)
% hObject    handle to logout1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.getstarted,'visible','on');
set(handles.st1,'String','');
set(handles.annotationpanel,'visible','off');
% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.afterlogin,'visible','on');
set(handles.videoname,'String','');
set(handles.annotationpanel,'visible','off');
% --- Executes on button press in back.
