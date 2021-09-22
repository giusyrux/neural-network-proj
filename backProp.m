function []=backProp(layers,gradOutput)
    for i=length(layers):-1:1
       if i == length(layers) %Caso Output
            delta = derivFunction(layers(i).act,layers(i).a) .* gradOutput;
       end
       %Caso Hidden
       delta = layers(i).W' * delta;
       delta = delta * derivFunction(layers(i).act,layers(i).a);
       if i==1
           layers(i).gradient = layers(i).gradient + delta * (x)';
       else
           layers(i).gradient = layers(i).gradient + delta * (layers(i-1).z)';
       end
    end
end