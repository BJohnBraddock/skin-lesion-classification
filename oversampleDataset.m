% oversampleDataset.m
%  Equalizes the label coounts for each category in an imageDatastore by 
%       duplicating images in categories that do not meet theh target threshold 
%   
%  This technique of duplicating images in minority categories is called
%  oversampling. To decrease the image count in majority categories would
%  be to undersample. 
%
% Inputs:
%   imds - imageDatastore obj to be oversampled
%   targetCountPerLabel - upper limit for how many images in each category
%                           after replication
% Output:
%   balImds - imageDatastore obj where minority categories have been
%               oversampled
%                              
% (Badly Optimized)
%
% Last updated: 10-7-2021 by John Braddock
function [balImds] = oversampleDataset(imds, targetCountPerLabel)
    
    labelCounts = countEachLabel(imds);
    num_labels = numel(labelCounts.Label);
    underRepresented = (labelCounts.Count < targetCountPerLabel);

    balImds = imds.copy;
    for i = 1:num_labels
        if (underRepresented(i))
            replicateSet = subset(imds, (imds.Labels == labelCounts.Label(i)));

            replicationFactor = ceil(targetCountPerLabel/numel(replicateSet.Labels));
        

            for j = 1:replicationFactor
                balImds_temp = balImds.copy;
                balImds.Files = cat(1, balImds_temp.Files, replicateSet.Files);
                balImds.Labels = cat(1, balImds_temp.Labels, replicateSet.Labels);
            end
        end

    end

end