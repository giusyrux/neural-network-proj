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
       layers(i).preGradient = layers(i).gradient.W;
       
       %ora calcolo il gradiente
       if i==1
           
           gradHidden = delta*(x)'; %per il layer di input uso l'input della rete
       else
           
           gradHidden = delta*(layers(i-1).z)'; %altrimenti uso l'output del layer precedente  
       end
       layers(i).gradient.W = gradHidden;
        
       %layers(i).gradient.B = layers(i).gradient.B + sum(delta,2);
       %layers(i).gradient.B = layers(i).gradient.B + sum(gradOutput); %calcolo del bias
       % https://towardsdatascience.com/understanding-backpropagation-algorithm-7bb3aa2f95fd
       
       layers(i).matrixSign = sign(layers(i).preGradient.*layers(i).gradient.W); %calcolo del segno
    end
end