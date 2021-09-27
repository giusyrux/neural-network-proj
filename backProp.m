function layers = backProp(layers,gradOutput,x)
%back propagation per il calcolo del gradiente
%layers: struct contenente i vari strati della rete
%gradOutput: derivata della funzione di errore relativa all'output della rete
%x: input della rete

    for i=length(layers):-1:1
        
       if i == length(layers) 
           
           %caso output: derivata funzione identità e prodotto element-wise
           %con derivata della funzione di errore (gradOutput)
           delta = derivFunction(layers(i).act,layers(i).a,x) .* gradOutput;
       
       else
           
           %caso hidden
           delta = layers(i).W' * delta;
           delta = delta * derivFunction(layers(i).act,layers(i).a,x);
       end
       
       %calcolo del gradiente
       if i==1
           layers(i).gradient.W = layers(i).gradient + delta * (x)';
       else
           layers(i).gradient.W = layers(i).gradient + delta * (layers(i-1).z)';
       end
       
       layers(i).gradient.B = sum(gradOutput); %calcolo del bias
    end
end
