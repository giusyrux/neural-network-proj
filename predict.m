function y = predict(net,x,hassoftmax)
%predico l'output della rete
%net: la rete
%x: input della rete
    epsilon=10^(-4);
    net.layers = forwardProp(net.layers,x); %aggiorno i parametri
    
    if hassoftmax %valuto params per capire se applicare softmax
        m = net.layers(size(net.layers,2)).z;
        disp(m(:,1)');
        m = m+epsilon;
        disp(m(:,1)');
        y = softmax(m+epsilon); %softmax all'output della rete
    else
       y = net.layers(size(net.layers,2)).z;
    end
    
end

