function [layers]=createLayers(params, inputSize, outputSize)

%params = parametri dati dall'utente utili alla costruzione della rete
%inputSize = numero di variabili in ingresso (x1,...,xd)
%outputSize = numero nodi dello strato di output pari al numero di classi

    neurons = params.neurons; %array di lunghezza = n strati e ogni cella contiene numero di neuroni
    nLayers = length(neurons);
    layers = repmat(struct('W', zeros(0)), 1, nLayers); %uno strato sarà una struct con i suoi campi

    %inizializzo il parametro size per ogni strato per determinare le
    %dimensioni delle matrici dei pesi e del gradiente
    if isempty(neurons)
        layers(1).size = [inputSize,outputSize];
    else 
        layers(1).size = [inputSize, neurons(1)];
        for i = 2:nLayers-1	
            layers(i).size = [neurons(i-1), neurons(i)];
        end	
        layers(nLayers).size = [neurons(end), outputSize];

    end

    %imposto i parametri per ogni strato
    for i=1:nLayers 
        layers(i).act = params.act(i); %funzione di attivazione per ogni strato
        layers(i).W = randn(layers(i).size(2),layers(i).size(1)); %matrice pesi
        layers(i).B = zeros(layers(i).size(2),1); %vettore di bias
        layers(i).gradient = zeros(layers(i).size(2),layers(i).size(1)); %matrice del gradiente
    end
end