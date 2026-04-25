function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 26-Apr-2026 14:53:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;
% ????? ????? ???????? ??? 1 ? 10
num1 = randi([1, 10]);
num2 = randi([1, 10]);

% ????? ??????? ??????? ?? ???????? (handles) ?????? ????? ??????
handles.correctAnswer = num1 + num2;

% ??? ??????? ?? ??? Static Text (text1)
set(handles.text1, 'String', [num2str(num1), ' + ', num2str(num2), ' = ?']);

% ????? ????????
% 1. ????? ??????? (Static Text) - ??????? ????? ?????? ????
set(handles.text1, 'FontSize', 28, ...
                   'FontWeight', 'bold', ...
                   'ForegroundColor', [0.2, 0.2, 0.6]);
                  ... % ???? ????

% 2. ????? ???? ??????? (Edit Text)
set(handles.edit1, 'FontSize', 20, ...
                   'BackgroundColor', [1, 1, 0.9], ... % ???? ???? ???? ???? ?????
                   'HorizontalAlignment', 'center');

% 3. ????? ???? (Pushbutton) - ?????? ???? ????? ???????
set(handles.pushbutton2, 'FontSize', 16, ...
                         'FontWeight', 'bold', ...
                         'String', 'CHECK ANSWER', ...
                         'BackgroundColor', [0, 0.5, 0], ... % ????
                         'ForegroundColor', [1, 1, 1]); % ????
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function pushbutton1_Callback(hObject, eventdata, handles)
video_file = 'lesson_video.mp4'; 

if exist(video_file, 'file')
    % ????? ?? ????? ??????? ?? ????? ?????? ??? ????????? (??? ?????)
    implay(video_file); 
else
    msgbox('????? ?? ???? ??????? ?? ????? ??????? ???? lesson_video.mp4');
end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ?????? ??? ????? ?????? ?? ??? Edit Text
% ?????? ??? ????? ??????
userAnswer = str2double(get(handles.edit1, 'String'));

if userAnswer == handles.correctAnswer
    % ????? ???? ?? ?????? 
    msgbox('EXCELLENT! You are a Math Star! ?', 'Success', 'help');
    
    % ????? ??? ??????? ?????? ???? ?? ???????? ???????
    set(handles.figure1, 'Color', [0.8, 1, 0.8]); % ???? ????
    pause(0.5);
    set(handles.figure1, 'Color', [0.95, 0.95, 0.95]); % ?????? ???? ??????
    
    % ????? ????? ?????
    generate_new_question(hObject, handles); 
else
    % ????? ?????? ????
    msgbox('Keep trying! You can do it! ?', 'Try Again', 'warn');
    set(handles.edit1, 'String', ''); % ??? ??????? ???????
end