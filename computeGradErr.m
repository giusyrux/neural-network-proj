function gradErr = computeGradErr(y,t,loss,hassoftmax)
%calcolo della derivata della funzione di errore con/senza softmax
%y: output della rete
%t: label del DS
%hassoftmax: booleano

    if ~hassoftmax
        
        switch(loss)
            
            case("ss")
                gradErr = y-t;
                
            case("ce")
                n = size(y); %quante volte iterare la sommatoria
                gradErr = -sum(t./y, n(2));
        end
        
    else
        
        z = softmax(y); %applico softmax
        gradErr = z-t; %cross-entropy con softmax  
   end
end