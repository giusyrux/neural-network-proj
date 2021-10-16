function layers = resilientProp(layers,epoch)

    etaP = 1.2; %etaP > 1 per incrementare delta(i,j)
     
    etaN = 0.5; %0 < etaN < 1 per decrementare delta(i,j)
    
    %range di valori per i delta
    deltaMax = 0.00025;
    deltaMin = 10^(-6);

    if epoch > 1

        for i=1:length(layers)
            
            % prodotto positivo
            layers(i).D.W(layers(i).matrixSign.W>0) = layers(i).D.W(layers(i).matrixSign.W>0)*etaP;
            layers(i).D.W(layers(i).matrixSign.W>0) = min(layers(i).D.W(layers(i).matrixSign.W>0),deltaMax);

            layers(i).D.B(layers(i).matrixSign.B>0) = layers(i).D.B(layers(i).matrixSign.B>0)*etaP;
            layers(i).D.B(layers(i).matrixSign.B>0) = min(layers(i).D.B(layers(i).matrixSign.B>0),deltaMax);
            
            % prodotto negativo
            layers(i).D.W(layers(i).matrixSign.W<0) = layers(i).D.W(layers(i).matrixSign.W<0)*etaN;
            layers(i).D.W(layers(i).matrixSign.W<0) = max(layers(i).D.W(layers(i).matrixSign.W<0),deltaMin);

            layers(i).D.B(layers(i).matrixSign.B<0) = layers(i).D.B(layers(i).matrixSign.B<0)*etaN;
            layers(i).D.B(layers(i).matrixSign.B<0) = max(layers(i).D.B(layers(i).matrixSign.B<0),deltaMin);
            % aggiornamento dei pesi
            g = sign(layers(i).gradient.W).*layers(i).D.W;
            layers(i).W = layers(i).W-g;
            % aggiornamento dei bias
            g = sign(layers(i).gradient.B).*layers(i).D.B;
            layers(i).B = layers(i).B-g;
            
        end
    end
    end