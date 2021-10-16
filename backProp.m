function layers = backProp(layers,gradOutput,x)
%back propagation per il calcolo del gradiente
%layers: struct contenente i vari strati della rete
%gradOutput: derivata della funzione di errore relativa all'output della rete
%x: input della rete

    for i=length(layers):-1:1
        
       if i == length(layers) 
           
           %caso output: derivata funzione identità e prodotto element-wise
           %con derivata della funzione di errore (gradOutput)
           h = derivFunction(layers(i).act,layers(i).a);
           delta = h .* gradOutput;
       else
           
           %caso hidden
           delta = (layers(i+1).W)' * delta;
           h = derivFunction(layers(i).act,layers(i).a);
           delta = delta .* h;
          
       end
       
       %salvo il gradiente del layer i-esimo prima che cambi
       layers(i).preGradient.W = layers(i).gradient.W;
       layers(i).preGradient.B = layers(i).gradient.B;
       %ora calcolo il gradiente
       if i==1
           
           layers(i).gradient.W = delta*(x)'; %per il layer di input uso l'input della rete
       else
           
           layers(i).gradient.W = delta*(layers(i-1).z)'; %altrimenti uso l'output del layer precedente  
       end
       layers(i).gradient.B = sum(delta,2);

       
       layers(i).matrixSign.W = sign(layers(i).preGradient.W .* layers(i).gradient.W); %calcolo del segno
       layers(i).matrixSign.B = sign(layers(i).preGradient.B .* layers(i).gradient.B);
    end
end