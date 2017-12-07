function varargout = juliaGUI(varargin)
% JULIAGUI MATLAB code for juliaGUI.fig
%      JULIAGUI, by itself, creates a new JULIAGUI or raises the existing
%      singleton*.
%
%      H = JULIAGUI returns the handle to a new JULIAGUI or the handle to
%      the existing singleton*.
%
%      JULIAGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in JULIAGUI.M with the given input arguments.
%
%      JULIAGUI('Property','Value',...) creates a new JULIAGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before juliaGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to juliaGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help juliaGUI

% Last Modified by GUIDE v2.5 26-Apr-2017 19:27:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @juliaGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @juliaGUI_OutputFcn, ...
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


% --- Executes just before juliaGUI is made visible.
function juliaGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to juliaGUI (see VARARGIN)

    cx = 0; cy = 0;
    handles.c = str2double(get(handles.cin,'String'));
    handles.maxstep = str2double(get(handles.maxstepin,'String'));
    handles.m = str2double(get(handles.min,'String'));
    handles.wid = str2double(get(handles.widin,'String'));
    x = linspace(cx - handles.wid,cx + handles.wid,handles.m);
    y = linspace(cy - handles.wid,cy + handles.wid,handles.m);
    [X,Y] = meshgrid(x,y);
    Z = X + 1i*Y;
    for k = 1:handles.maxstep
        Z = Z.^2+handles.c;
        W = exp(-abs(Z));
    end
    colormap prism(256)
    pcolor(W);
    shading flat;

% Choose default command line output for juliaGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes juliaGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = juliaGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    cx = 0; cy = 0;
    handles.c = str2double(get(handles.cin,'String'));
    handles.maxstep = str2double(get(handles.maxstepin,'String'));
    handles.m = str2double(get(handles.min,'String'));
    handles.wid = str2double(get(handles.widin,'String'));
    x = linspace(cx - handles.wid,cx + handles.wid,handles.m);
    y = linspace(cy - handles.wid,cy + handles.wid,handles.m);
    [X,Y] = meshgrid(x,y);
    Z = X + 1i*Y;
    for k = 1:handles.maxstep
        Z = Z.^2+handles.c;
        W = exp(-abs(Z));
    end
    colormap prism(256)
    pcolor(W);
    shading flat;
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    

function cin_Callback(hObject, eventdata, handles)
% hObject    handle to cin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.c = str2double(get(handles.cin,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of cin as text
%        str2double(get(hObject,'String')) returns contents of cin as a double


% --- Executes during object creation, after setting all properties.
function cin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxstepin_Callback(hObject, eventdata, handles)
% hObject    handle to maxstepin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.maxstep = str2double(get(handles.maxstepin,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of maxstepin as text
%        str2double(get(hObject,'String')) returns contents of maxstepin as a double


% --- Executes during object creation, after setting all properties.
function maxstepin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxstepin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function min_Callback(hObject, eventdata, handles)
% hObject    handle to min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.m = str2double(get(handles.min,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of min as text
%        str2double(get(hObject,'String')) returns contents of min as a double


% --- Executes during object creation, after setting all properties.
function min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function widin_Callback(hObject, eventdata, handles)
% hObject    handle to widin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.wid = str2double(get(handles.widin,'String'));
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of widin as text
%        str2double(get(hObject,'String')) returns contents of widin as a double


% --- Executes during object creation, after setting all properties.
function widin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to widin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
