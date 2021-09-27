function [X,T] = prepareDataset(files)
%estraggo i dati X e le label T dal DS

    X = loadMNISTImages(files(1));
    T = getTargetsFromLabels(loadMNISTLabels(files(2)));
end

