function y = predict(net,x,hassoftmax)
%predico l'output della rete
%net: la rete
%x: input della rete

    net.layers = forwardProp(net.layers,x); %aggiorno i parametri
    
    if hassoftmax %valuto params per capire se applicare softmax
        m = net.layers(size(net.layers,2)).z;
        y = softmax(m); %softmax all'output della rete
    else
       y = net.layers(size(net.layers,2)).z;
    end
end

