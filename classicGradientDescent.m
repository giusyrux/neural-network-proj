function layers = classicGradientDescent(layers)
eta=0.1;
for i=1:size(layers,2)
    h = eta*layers(i).gradient.W;
    layers(i).W = layers(i).W - h;
    layers(i).B = layers(i).B - eta*layers(i).gradient.B;
end

