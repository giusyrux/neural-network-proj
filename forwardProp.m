function layers = forwardProp(layers, input)

%layers = struct contenente i vari strati della rete
%input = input del primo strato

    z=input; %l'input del primo strato coincide con l'output
    
    for i=1:length(layers)
        
       W = layers(i).W;
       B = layers(i).B;
       act = layers(i).act;
       a = W*z+B;
      
       switch (act)
            case "identity" %la uso per l'ultimo strato poichè è lineare(output)
               z = identity(a);
           case "sigmoid" && i ~= lenght(layers)
               z = sigm(a);
           case "softmax" && i ~= lenght(layers)
               z = softmax(a);
           case "relu" && i ~= lenght(layers)
               z = relu(a);
       end
       
       layers(i).a = a;
       layers(i).z = z;
    end
end