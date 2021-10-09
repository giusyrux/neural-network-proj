function net = createNet(params,inputSize,outputSize)
%creo la rete
%params: parametri della rete
%inputSize: numero di linee d'ingresso
%outputSize: numero di classi

    net.name = params.name;
    net.layers = createLayers(params,inputSize,outputSize); %inizializzo gli strati della rete
end
