function layers = clearValues(layers)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
for i=1:size(layers,2)
    layers(i).gradient.W = zeros(layers(i).size(2),layers(i).size(1));
end
end

