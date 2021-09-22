function [output] = derivFunction(activation,a)
switch(activation)
    case("sigmoid")
        output = a .*(1-a);
    case("relu")
        if a>0
            output = 1;
        else 
            output = 0;
        end
    %case("softmax")
        
end

end

