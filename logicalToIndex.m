% Converts a logical column vector classification to an index representing
% that classification
% This function is intended to be used with the rowfun() table function. 
% 
% Last updated: October 2, 2021



function [idx] = logicalToIndex(row)
    [~,idx] = max(row);
end