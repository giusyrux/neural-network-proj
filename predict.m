function y = predict(net,x,hassoftmax)
%predico l'output della rete
%net: la rete
%x: input della rete

    net.layers = forwardProp(net.layers,x); %aggiorno i parametri
    
    if hassoftmax %valuto params per capire se applicare softmax
        y = softmax(net.layers(size(net.layers,2)).z); %softmax all'output della rete
    end
end

