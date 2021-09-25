function [X,T] = prepareDataset(files)
    X=loadMNISTImages(files(1));
    T=getTargetsFromLabels(loadMNISTLabels(files(2)));
end

