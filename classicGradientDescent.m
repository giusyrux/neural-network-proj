function layers = classicGradientDescent(layers)
eta=0.0001;
for i=1:size(layers,2)
    %h=-0.001;%simuliamo un aggiornamento fetente ma normale
    h = eta*layers(i).gradient.W;
    layers(i).W = layers(i).W - h;
    %layers(i).B = layers(i).B - eta*layers(i).gradient.B;
end

