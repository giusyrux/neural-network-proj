function layers = classicGradientDescent(layers)
%discesa classica del gradiente per aggiornare i parametri
%si può usarlo per la prima epoca invece di aggiornare random i parametri

    eta = 10^(-4); %learning rate
    
    for i=1:size(layers,2)
        
        h = eta*layers(i).gradient.W;
        layers(i).W = layers(i).W - h;
        %layers(i).B = layers(i).B - eta*layers(i).gradient.B;
    end
end