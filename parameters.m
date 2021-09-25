prompt = "Digitare nome della rete: ";
params.name = input(prompt,'s');

params.neurons = [10 5 6];

params.nLayers = size(params.neurons,2);

params.act = ["relu" "relu" "identity"];

params.softmax = 1; % valore true

params.epochs = 2;

params.cost = "ce";


params.percentTrain = 0.5;

params.percentValidation = 0.25;

params.percentTest = 0.25;
