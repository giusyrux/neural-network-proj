function output = derivFunction(act,a,x)
%derivate delle varie funzioni di attivazione
%a: valore a cui applicare la funzione di attivazione
%x: input della rete
    
    switch(act)
        
        case("identity")
            output = ones(size(x));
        case("sigmoide")
            output = a.*(1-a);
        case("relu")
            if a>0
                output = 1;
            else 
                output = 0;
            end
        case("hv")
           output=0;
    end
end
