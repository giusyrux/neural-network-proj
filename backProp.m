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
       
       layers(i).precGradient = layers(i).gradient.W;
       % IGNORA -> layers(i).gradient.W = zeros(size(layers(i).gradient.W));
       %calcolo del gradiente
       if i==1
           p = delta * (x)';
           layers(i).gradient.W = p;%layers(i).gradient.W + p;
       else
           p = delta * (layers(i-1).z)';
           layers(i).gradient.W = p;%layers(i).gradient.W + p;
       end
        
       %layers(i).gradient.B = layers(i).gradient.B + sum(delta,2);
       %layers(i).gradient.B = layers(i).gradient.B + sum(gradOutput); %calcolo del bias
       % https://towardsdatascience.com/understanding-backpropagation-algorithm-7bb3aa2f95fd
       
       layers(i).matrixSign = sign(layers(i).precGradient.*layers(i).gradient.W); % calcolo del segno
    end
end
