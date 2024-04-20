%% INPUTS
%Below input will be specific to you storage location
preprocess_dir = 'C:\Users\Mike\Desktop\BS_Networks\NIRSprobe2YeoNetworks\example'; %location of channel_mnicoords.csv
yeodir = 'C:\Users\Mike\Desktop\BS_Networks\NIRSprobe2YeoNetworks'; %location of Yeo network info
nparc = 42; %Number of channels
YeoNum = 7; %7 or 17 networks

%% Function to get Yeo Networks based on probe MNI coordinates
addpath(genpath(yeodir)) %Make sure this path is where ever you have the scripts located

yeoNetNames = getyeonetnames(preprocess_dir, yeodir, nparc, YeoNum);

% To add a channel number column (not really necessary)
channels=1:nparc;
yeoNetNames.Channel =channels';


