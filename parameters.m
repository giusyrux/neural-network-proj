%inizializzo i parametri della rete

params.neurons = [128 64 32]; %neuroni per ogni strato hidden

params.nLayers = size(params.neurons,2)+1; %numero strati

params.act = ["relu" "relu" "relu"]; %funzioni di attivazione

params.softmax = 1; % valore booleano per capire se applicare softmax

params.epochs = 50; %numero di epoche

params.cost = "ce"; %funzione di errore

%divisione DS in train set, test set e validation test

params.percentTrain = 0.5;

params.percentValidation = 0.25;

params.percentTest = 0.25;