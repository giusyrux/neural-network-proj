function [gradOutput] = computeCost(y,t,costFunc,softmax)
% analizzare quando (non) viene specificato softmax nei parametri (softmax valore booleano)
if ~softmax % senza soft-max
    switch(costFunc)
            case("mse")
                gradOutput = y-t;
            case("crossentropy")
                n=size(y);
                gradOutput = -sum( t ./ y , n(2));
    end
else % softmax
    z= softmax(y);
    switch(costFunc)
            case("crossentropy")
                % -sum( t .* log(z));
                gradOutput = z-t;
    end
end

end

