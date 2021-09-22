function [gradOutput] = computeCost(y,t,costFunc)
switch(costFunc)
    case("mse")
        gradOutput = y-t;
    case("crossentropy")
        
        
end
end

