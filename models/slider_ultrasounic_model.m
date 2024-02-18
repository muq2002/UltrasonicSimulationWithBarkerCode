function varargout = slider_ultrasounic_model(varargin)
% SLIDER_ULTRASOUNIC_MODEL MATLAB code for slider_ultrasounic_model.fig
%      SLIDER_ULTRASOUNIC_MODEL, by itself, creates a new SLIDER_ULTRASOUNIC_MODEL or raises the existing
%      singleton*.
%
%      H = SLIDER_ULTRASOUNIC_MODEL returns the handle to a new SLIDER_ULTRASOUNIC_MODEL or the handle to
%      the existing singleton*.
%
%      SLIDER_ULTRASOUNIC_MODEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SLIDER_ULTRASOUNIC_MODEL.M with the given input arguments.
%
%      SLIDER_ULTRASOUNIC_MODEL('Property','Value',...) creates a new SLIDER_ULTRASOUNIC_MODEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before slider_ultrasounic_model_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to slider_ultrasounic_model_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help slider_ultrasounic_model

% Last Modified by GUIDE v2.5 14-Oct-2023 12:38:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @slider_ultrasounic_model_OpeningFcn, ...
                   'gui_OutputFcn',  @slider_ultrasounic_model_OutputFcn, ...
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


% --- Executes just before slider_ultrasounic_model is made visible.
function slider_ultrasounic_model_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to slider_ultrasounic_model (see VARARGIN)

% Choose default command line output for slider_ultrasounic_model
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes slider_ultrasounic_model wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = slider_ultrasounic_model_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get the value of the slider
slider_value = get(hObject, 'Value');

% Generate a sine wave signal with the frequency specified by the slider
frequency = slider_value * 1000;
t = linspace(0, 1, 100);
x = sin(2*pi*frequency*t);

% Plot the sine wave signal
plot(t, x);
end

% Create a new MATLAB GUI figure
figure;

% Add a slider to the GUI figure
slider = uicontrol('Style', 'slider', 'Min', 1, 'Max', 100, 'Value', 50, 'Callback', @slider_callback);

% Generate a sine wave signal with the frequency specified by the slider
frequency = 500;
t = linspace(0, 1, 100);
x = sin(2*pi*frequency*t);

% Plot the sine wave signal
plot(t, x);

% Set the axis limits
xlim([0 1]);
ylim([-1 1]);

% Label the axes
xlabel('Time (s)');
ylabel('Amplitude');

% Title the plot
title('Sine wave signal');

end
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
