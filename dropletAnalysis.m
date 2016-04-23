function path_root = dropletAnalysis(path_root)
% Ver 16042101


%% Set Default path of the head file
% path_root = 'F:\Documents\Doc-Research\Doc-20150324-Tau Droplet\data\041316';

if ~exist('path_root', 'var')
    path_root = uigetdir('C:/', 'Choose directory where the head.csv is');    %Choose directory containing TIFF files.
end

%%
processTifs([path_root, '\\raw']);

%% Generate Size Distribution
bwlabelpara = 4;  % lookup bwlabel.m
Eccentricity = 1;
thrd_adjust = -100; 
numberOfBins = 50; % Or whatever you want.
ifgroupon = 1;  % 1: average distribution of the regions
minDiam = 2/0.322;
maxDiam = 30/0.322;
SCALE = 0.322 / 2;


set(0,'DefaultFigureVisible','off');

sizeDist(path_root, ifgroupon, thrd_adjust, ...
    bwlabelpara,...
    Eccentricity, ...
    numberOfBins,...
    SCALE, ...
    minDiam, maxDiam)
%%

% yLimMax = 50;
% group.Salt = [0 10 20 30 50 100 150 500];
% group.Tau = [15 50 80 160];
% group.RNA = [50 70 150 240 480];
% group.glycerol = [0.15];

group.Salt = [0 30 50 100];
group.Tau = [15 50 80 160];
group.RNA = [50 150 240 480];
group.glycerol = [0.15];
% 
% compareSalt(path_root, group.Salt, group.Tau, group.RNA, group.glycerol, yLimMax);
% compareTau(path_root, group.Salt, group.Tau, group.RNA, group.glycerol, yLimMax);
% 
% comparePolyA(path_root, group.Salt, group.Tau, group.RNA, group.glycerol, yLimMax);
% compareSaltWithGlycerol(path_root, group.Salt, group.Tau, group.RNA, group.glycerol, yLimMax);
% compareGlycerol(path_root, group.Salt, group.Tau, group.RNA, group.glycerol, yLimMax);


Axis.xLim = [1.2 10];
Axis.yLim = [0 100];
Axis.Units = {'mM', 'uM', 'ugmL', 'vv'};
Instruction.col = [2 3 4 5];
Instruction.names = {'NaCl', 'Tau', 'RNA', 'Glycerol'};
Instruction.comparision = [1 2 3 4];
DivCell = struct2cell(group);
compareDim(path_root, DivCell, Instruction, Axis);
%%
Selection = [4 4];
Axis.xLim = [1 15];
Axis.yLim = [0 100];
compareDimThis(path_root, DivCell, Instruction, Axis, Selection);
%%
Instruction.comparision = [3 2 1 4];
compareDim(path_root, DivCell, Instruction, Axis);
Selection = [2 1];
Axis.xLim = [3 15];
Axis.yLim = [0 60];
compareDimThis(path_root, DivCell, Instruction, Axis, Selection);

%% comparision of tau-tRNA and tau-polyA 
inputtype = 'diameterDist';
prefix = 'untitled';
Axis.legends = {'tRNA', 'polyA'};

filenameIDs = [53 65];
Axis.title = 'tau = 160 uM, RNA = 480 ug/mL';
multi_plot(path_root, inputtype, prefix, filenameIDs, Axis)

filenameIDs = [35 15];
Axis.title = 'tau = 77 uM, RNA = 150 ug/mL';
multi_plot(path_root, inputtype, prefix, filenameIDs, Axis)

filenameIDs = [38 12];
Axis.title = 'tau = 74 uM, RNA = 240 ug/mL';
multi_plot(path_root, inputtype, prefix, filenameIDs, Axis)

filenameIDs = [59 68];
Axis.title = 'tau = 154 uM, RNA = 461 ug/mL, NaCl = 20 mM';
multi_plot(path_root, inputtype, prefix, filenameIDs, Axis)
end
