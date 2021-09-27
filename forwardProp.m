function layers = forwardProp(layers,input,softmax)
%forward propagation per aggiornare i valori
%layers: struct contenente i vari strati della rete
%input: input del primo strato

    z = input; %l'input del primo strato coincide con l'output
    
    for i=1:length(layers)
        
       W = layers(i).W; %inizializzo i pesi
       B = layers(i).B; %inizializzo i bias
       act = layers(i).act; %inizializzo le funzioni di attivazione
       a = W*z+B; % calcolo della a per poi calcolare z = f(a)
       if i < length(layers)
           switch (act)

               case "identity" %la uso per lo strato di output poichè è lineare
                   z = identity(a);
               case "sigmoid"
                   z = sigmoide(a);
               case "softmax" 
                   z = softmax(a);
               case "relu" 
                   z = relu(a);
               case "hv" 
                   z = hv(a);
           end
       else
           z = identity(a);
       end
       layers(i).a = a;
       layers(i).z = z;
    end

end
