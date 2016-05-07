function path_root = dropletAnalysis(path_root)

%% Set path of the head file
% path_root = 'F:\Documents\Doc-Research\Doc-20150324-Tau Droplet\data\050616';

if ~exist('path_root', 'var')
    path_root = uigetdir('C:/', 'Choose directory where the head.csv is');    %Choose directory containing TIFF files.
end

% Head Filename
headfilename = 'headVer05061601';

%% process Tifs
processTifs([path_root, '\\raw']);

%% Calculate Size Distribution
bwlabelpara = 4;  % lookup bwlabel.m
Eccentricity = 1;  % Threshold for Eccentricity
thrd_adjust = -20;  % Intensity threshold offset
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
    minDiam, maxDiam,...
    headfilename)
%% Set metadata
Axis.xLim = [0 12];
Axis.yLim = [0 150];
Axis.xLabel = 'Equivalent Diameter /\mum';
Axis.yLabel = 'Count #';
Axis.Units = {'mM', 'min', '', ''};

Instruction.col = [2 8 9 10];
Instruction.names = {'NaCl', 'SitTime', 'Sample', 'Trial'};
Instruction.comparision = [4 1 2 3];

group.Salt = [0 0.1 1 10];
group.SitTime = [5 10 20];
group.Sample = [1 3 4 5];
group.Trial = [1 2 3 4];

DivCell = struct2cell(group);
%% Plot
compareDim(path_root, DivCell, Instruction, Axis, headfilename);
Selection = [1 2 1];
plotThis(path_root, DivCell, Instruction, Axis, Selection, headfilename);
Selection = [2 2 2];
plotThis(path_root, DivCell, Instruction, Axis, Selection, headfilename);
Selection = [3 2 3];
plotThis(path_root, DivCell, Instruction, Axis, Selection, headfilename);
Selection = [4 2 4];
plotThis(path_root, DivCell, Instruction, Axis, Selection, headfilename);

end
