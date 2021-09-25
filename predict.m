function Y = predict(net,X)
    net.layers = forwardProp(net.layers,X);
    
    if params.softmax
        Y = softmax(net.layers(end).z);
    end
end

