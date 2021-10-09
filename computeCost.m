function gradOutput = computeCost(y,t,loss,hassoftmax)
%calcolo della derivata della funzione di errore con/senza softmax
%y: output della rete
%t: label del DS
%hassoftmax: booleano

    if ~hassoftmax
        
        switch(loss)
            
            case("mse")
                gradOutput = y-t;
                
            case("ce")
                n = size(y); %quante volte iterare la sommatoria
                gradOutput = -sum(t./y, n(2));
        end
        
    else
        
        z = softmax(y); %applico softmax
        gradOutput = z-t; %cross-entropy con softmax  
   end
end