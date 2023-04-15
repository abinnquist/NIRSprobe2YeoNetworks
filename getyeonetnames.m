function yeoNetNames = getyeonetnames(preprocess_dir, yeodir, nparc, YeoNum)
% Load in the fNIRS study MNI coordinates
mniCoords=strcat(preprocess_dir,filesep,'channel_mnicoords.csv');
mniCoords=table2array(readtable(mniCoords));

%Load in the Yeo MNI coordinates
warning off
yeoloc=strcat(yeodir,'/Yeo_',num2str(YeoNum),...
    'Networks/',num2str(YeoNum),'Network_centroidCoors_MNI152_2mm.csv');
yeoNetworks=readtable(yeoloc);
yeoNames=yeoNetworks(:,[2,6,7]);

coords=table2array(yeoNetworks(:,3:5));

% Loop to find the closest Yeo coordinate to the NIRS channel
% Uses pdist2 Euclidean distance
mindist=nan(nparc,1);
idx=nan(nparc,1);
for ch=1:nparc
    d = pdist2(mniCoords(ch,:), coords(:,:));
    [mindist(ch,1), idx(ch,1)] = min(d, [], 2);
end
warning on

yeoNetNames=yeoNames(idx,:);
