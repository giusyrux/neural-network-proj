function [output] = derivFunction(act,a,x)
%derivate delle varie funzioni di attivazione
    
    switch(act)
        
        case("identity")
            output = ones(size(x));
        case("sigmoid")
            output = a .*(1-a);
        case("relu")
            if a>0
                output = 1;
            else 
                output = 0;
            end
        case("hv")
           output=0;
        %case("softmax")
    end

end
