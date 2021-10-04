function output = derivFunction(act,a)
%derivate delle varie funzioni di attivazione
%a: valore a cui applicare la funzione di attivazione
%x: input della rete
    
    switch(act)
        
        case("identity")
            output = ones(size(a,1),size(a,2));
        case("sigmoid")
            a = sigmoide(a);
            output = a.*(1-a);
        case("relu")
            output = a;
            output(a>0)=1;
            output(a<=0)=0;
        case("hv")
           output=0;
    end
end
