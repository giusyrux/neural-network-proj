function layers = forwardProp(layers,input)
%forward propagation per aggiornare i valori
%layers: struct contenente i vari strati della rete
%input: input del primo strato

    z = input; %l'input del primo strato coincide con l'output
    
    for i=1:length(layers)
        
       W = layers(i).W; %inizializzo i pesi
       B = layers(i).B; %inizializzo i bias
       act = layers(i).act; %inizializzo le funzioni di attivazione
       a = W*z+B; % calcolo della a per poi calcolare z = f(a)
      
       switch (act)
           
            case "identity" %la uso per lo strato di output poichè è lineare
               z = identity(a);
           case "sigmoid" && i ~= lenght(layers)
               z = sigmoide(a);
           case "softmax" && i ~= lenght(layers)
               z = softmax(a);
           case "relu" && i ~= lenght(layers)
               z = relu(a);
           case "hv" && i ~= lenght(layers)
               z = hv(a);
       end
       
       layers(i).a = a;
       layers(i).z = z;
    end
end
