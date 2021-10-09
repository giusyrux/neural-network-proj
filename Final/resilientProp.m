function layers = resilientProp(layers,epoch)

    etaP = 1.2; %etaP > 1 per incrementare delta(i,j)
     
    etaN = 0.5; %0 < etaN < 1 per decrementare delta(i,j)
    
    %range di valori per i delta
    deltaMax = 10^(-4);
    deltaMin = 10^(-6);

    if epoch > 1

        for i=1:length(layers)
            
            % prodotto positivo
            layers(i).D(layers(i).matrixSign>0) = layers(i).D(layers(i).matrixSign>0)*etaP;
            layers(i).D(layers(i).matrixSign>0) = min(layers(i).D(layers(i).matrixSign>0),deltaMax);

            % prodotto negativo
            layers(i).D(layers(i).matrixSign<0) = layers(i).D(layers(i).matrixSign<0)*etaN;
            layers(i).D(layers(i).matrixSign<0) = max(layers(i).D(layers(i).matrixSign<0),deltaMin);

            % aggiornamento dei pesi
            g = sign(layers(i).gradient.W).*layers(i).D;
            layers(i).W = layers(i).W-g;
            %layers(i).B = layers(i).B + layers(i).gradient.B;
        end
    else
        
        layers = classicGradientDescent(layers); %aggiorno i parametri per la prima epoca
    end
end