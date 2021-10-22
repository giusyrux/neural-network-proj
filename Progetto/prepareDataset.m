function [x,t] = prepareDataset(files)
%estraggo i dati x e le label t dal DS

    x = loadMNISTImages(files(1));
    t = getTargetsFromLabels(loadMNISTLabels(files(2)));
end