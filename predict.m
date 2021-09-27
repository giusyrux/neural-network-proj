function y = predict(net,x,softmax)
%predico l'output della rete
%net: la rete
%x: input della rete

    net.layers = forwardProp(net.layers,x); %aggiorno i parametri
    
    if softmax %valuto params per capire se applicare softmax
        
        y = softmax(net.layers(end).z); %softmax all'output della rete
    end
end

