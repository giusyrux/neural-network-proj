function net=createNet()

    prompt = "Digitare nome della rete: ";
    params.name = input(prompt,'s');
    
    prompt2 = "Digitare numero di neuroni: ";
    params.neurons = input(prompt2);
    
    net.name = params.name; %nome della rete che ovviamente è inutile
    net.layers = createLayers(params,5,2); %inizializzo gli strati della rete

end
