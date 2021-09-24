function []=backProp(layers,gradOutput,x)

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
       
       if i==1
           layers(i).gradient = layers(i).gradient + delta * (x)';
       else
           layers(i).gradient = layers(i).gradient + delta * (layers(i-1).z)';
       end
    end
end
