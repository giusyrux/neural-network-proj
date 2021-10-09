function layers = rprop(layers, epochs)
% rprop: regola di aggiornamento dei pesi
% associare ad ogni parametro W uno step di aggiornamento delta(i,j)>0 : costruire una matrice di delta(i,j) di dimensione uguale a quella di W
% modificare opportunatamente i delta(i,j) durante il learning
%% REGOLA DI AGGIORNAMENTO -> W(i,j)(t) = W(i,j)(t-1)-sign(g(i,j)(t))*delta(i,j)
% g(i,j)(t)=derivata di E rispetto al peso W(i,j) dell'epoca t
%% PSEUDOCODICE
%delta_i_j = randn(size(layers(1).W)) % DEVONO ESSERE VALORI POSITIVI

etaP = 1.2;
% etaP > 1 per incrementare delta(i,j) 
etaN = 0.5;
% 0<etaN<1 per decrementare delta(i,j)

deltaMax = 50;
deltaMin = 10^(-6);%10^(-6);

if epochs==1
    % per il primo step (t=1, prima epoca) posso scegliere di fare senza
    % aggiornare i pesi oppure applicare la discesa del gradiente standard
else
    for i=1:length(layers)
        % prodotto positivo
        layers(i).D(layers(i).matrixSign>0)=layers(i).D(layers(i).matrixSign>0)*etaP;
        layers(i).D(layers(i).matrixSign>0) = min(layers(i).D(layers(i).matrixSign>0),deltaMax); %non avevamo messo assegnazione
        
        % prodotto negativo
        layers(i).D(layers(i).matrixSign<0) = layers(i).D(layers(i).matrixSign<0)*etaN;
        layers(i).D(layers(i).matrixSign<0) = max(layers(i).D(layers(i).matrixSign<0),deltaMin); %non avevamo messo assegnazione
        
        % aggiornamento dei pesi
        g = sign(layers(i).gradient.W).*layers(i).D;
        layers(i).W=layers(i).W-g;
        %layers(i).B = layers(i).B + layers(i).gradient.B;
    end
end
end
