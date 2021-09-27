function gradOutput = computeCost(y,t,costFunc,hassoftmax)
%calcolo della derivata della funzione di errore con/senza softmax
%y: output della rete
%t: label del DS
%softmax: booleano

    if ~hassoftmax
        
        switch(costFunc)
            
            case("mse")
                gradOutput = y-t;
            case("ce")
                n = size(y); %quante volte iterare la sommatoria
                gradOutput = -sum(t./y, n(2));
        end
        
    else
        
        z = softmax(y);
        gradOutput = z-t; %cross-entropy con softmax     
    end
end
