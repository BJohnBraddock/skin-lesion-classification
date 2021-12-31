# skin-lesion-classificaiton || bme3053c-team-project
***Triple Js + Wilson*** group final project for **BME3053C** : Computer Applications for BME at the University of Florida

Members: 
- Brian John Braddock
- James Bratt
- Wilson Huang
- Julie Vu

## Objective

Classify Dermascopic Images of Skin Lesions 

- Employ basic preprocessing and transfer learning
- Visualize classification model with Occlusion Sensitivity
- Integrate metadata features into image classification CNN architecture

Dataset is from the ISIC (International Skin Imaging Collaboration) 2019 Challenge
https://challenge.isic-archive.com/landing/2019

## Instructions
To classify a single image with our trained model, run classify_image.m .

To train and evaluate a normal image classification model, open main.mlx and run each section. 

To train and evalute an image classification model with metadata, open train_with_metadata.mlx and run each section. 

If you don't wish to train the model, we have provided pretrained models. Simply load them into the MATLAB workspace instead of running the model training sections. Dataset splitting is not randomized, so the models will not be evaluating training data. 


## References
Training Data Attributions:

BCN_20000 Dataset: (c) Department of Dermatology, Hospital Clínic de Barcelona

HAM10000 Dataset: (c) by ViDIR Group, Department of Dermatology, Medical University of Vienna; https://doi.org/10.1038/sdata.2018.161

MSK Dataset: (c) Anonymous; https://arxiv.org/abs/1710.05006 ; https://arxiv.org/abs/1902.03368
