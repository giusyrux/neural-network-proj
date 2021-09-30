%inizializzo i parametri della rete

prompt = "Digitare nome della rete: ";
params.name = input(prompt,'s');

params.neurons = [32 16 10]; %neuroni per ogni strato

params.nLayers = size(params.neurons,2); %numero strati

params.act = [ "relu" "relu" "identity" ]; %funzioni di attivazione

params.softmax = 1; % valore booleano per capire se applicare softmax

params.epochs = 25; %numero di epoche

params.cost = "ce"; %funzione di errore

%divisione DS in train set, test set e validation test

params.percentTrain = 0.5;

params.percentValidation = 0.25;

params.percentTest = 0.25;
