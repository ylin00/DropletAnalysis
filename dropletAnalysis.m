function path_root = dropletAnalysis(path_root)

%% Set Default path of the head file
path_root = 'F:\Documents\Doc-Research\Doc-20150324-Tau Droplet\data\050616';

if ~exist('path_root', 'var')
    path_root = uigetdir('C:/', 'Choose directory where the head.csv is');    %Choose directory containing TIFF files.
end

% Head Filename
headfilename = 'head';

%%
% processTifs([path_root, '\\raw']);

%% Size Distribution
bwlabelpara = 4;  % lookup bwlabel.m
Eccentricity = 1;  % Threshold for Eccentricity
thrd_adjust = -20;  % Intensity threshold offset
numberOfBins = 50; % Or whatever you want.
ifgroupon = 1;  % 1: average distribution of the regions
minDiam = 2/0.322;
maxDiam = 30/0.322;
SCALE = 0.322 / 2;

set(0,'DefaultFigureVisible','off');

% sizeDist(path_root, ifgroupon, thrd_adjust, ...
%     bwlabelpara,...
%     Eccentricity, ...
%     numberOfBins,...
%     SCALE, ...
%     minDiam, maxDiam,...
%     headfilename)
%%

group.Salt = [0 0.1 1 10];
group.SitTime = [5 10 20];
group.Sample = [1 3 4 5];
group.Trial = [1 2 3 4];

Axis.xLim = [0 12];
Axis.yLim = [0 150];
Axis.Units = {'mM', 'min', '#', '#'};
Instruction.col = [2 8 9 10];
Instruction.names = {'NaCl', 'SitTime', 'Sample', 'Trial'};
DivCell = struct2cell(group);
%%
Instruction.comparision = [4 1 2 3];
compareDim(path_root, DivCell, Instruction, Axis, headfilename);
Instruction.comparision = [4 1 2 3];
Selection = [1 2 1];
compareDimThis(path_root, DivCell, Instruction, Axis, Selection, headfilename);
Selection = [2 2 2];
compareDimThis(path_root, DivCell, Instruction, Axis, Selection, headfilename);
Selection = [3 2 3];
compareDimThis(path_root, DivCell, Instruction, Axis, Selection, headfilename);
Selection = [4 2 4];
compareDimThis(path_root, DivCell, Instruction, Axis, Selection, headfilename);
% %%
% Selection = [1 3];
% Axis.xLim = [0 12];
% Axis.yLim = [0 120];
% compareDimThis(path_root, DivCell, Instruction, Axis, Selection, headfilename);
% %%
% Instruction.comparision = [3 2 1 4];
% compareDim(path_root, DivCell, Instruction, Axis, headfilename);
% %%
% Selection = [3 1];
% Axis.xLim = [0 10];
% Axis.yLim = [0 200];
% compareDimThis(path_root, DivCell, Instruction, Axis, Selection, headfilename);
% Selection = [2 1];
% Axis.xLim = [0 10];
% Axis.yLim = [0 200];
% compareDimThis(path_root, DivCell, Instruction, Axis, Selection, headfilename);

% %% comparision of tau-tRNA and tau-polyA 
% inputtype = 'diameterDist';
% prefix = 'untitled';
% Axis.legends = {'tRNA', 'polyA'};
% 
% filenameIDs = [53 65];
% Axis.title = 'tau = 160 uM, RNA = 480 ug/mL';
% multi_plot(path_root, inputtype, prefix, filenameIDs, Axis)
% 
% filenameIDs = [35 15];
% Axis.title = 'tau = 77 uM, RNA = 150 ug/mL';
% multi_plot(path_root, inputtype, prefix, filenameIDs, Axis)
% 
% filenameIDs = [38 12];
% Axis.title = 'tau = 74 uM, RNA = 240 ug/mL';
% multi_plot(path_root, inputtype, prefix, filenameIDs, Axis)
% 
% filenameIDs = [59 68];
% Axis.title = 'tau = 154 uM, RNA = 461 ug/mL, NaCl = 20 mM';
% multi_plot(path_root, inputtype, prefix, filenameIDs, Axis)
end
