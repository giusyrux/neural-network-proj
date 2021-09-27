function net = createNet(params,XTrain,TTrain)
%creo la rete
%params: parametri della rete
%XTrain: insieme dei dati di train
%TTrain: insieme di label di train

    net.name = params.name;
    net.layers = createLayers(params,XTrain,TTrain); %inizializzo gli strati della rete
end
