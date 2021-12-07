%% 
% Classify a single image
close all; clear; clc;


filename = input("Enter the name of the file you wish to classify: ", 's');
img = imread(filename);

img = imresize(img, [224, 224]);


load("GoogLeNet_Model.mat");
classes = categorical(cellstr((["Actinic keratosis"; "Basal cell carcinoma"; "Benign keratosis"; "Dermatofibroma"; "Melanocytic nevus"; "Melanoma"; "Squamous cell carcinoma"; "Vascular lesion"])));


[pred, scores] = classify(lesionNet, img);


[top_score, top_idx]  = maxk(scores, 3);
top = classes(top_idx);

figure(1);
subplot(2,2,1);
imshow(img);
title(pred);
for i = 1:3
    map = occlusionSensitivity(lesionNet,img,top(i));
    
    subplot(2,2,i+1);
    imshow(img,'InitialMagnification',100)


    hold on 
    imagesc(map,'AlphaData',.3)
    colormap jet
    colorbar
    title({"Occlusion sensitivity", sprintf("(%s, %.2f)", top(i), top_score(i))})
    hold off

end

fig = uifigure;
T = table(classes, scores', 'VariableNames', ["classes", "confidence"]);
uitable(fig, 'Data', T);