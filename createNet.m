function net=createNet(params,XTrain,TTrain)
    net.name = params.name;
    net.layers = createLayers(params,XTrain,TTrain); %inizializzo gli strati della rete
end
