function z = hv(a)
%calcolo output strato interno (y=f(a)) con heaviside come funzione di attivazione
    
    if a>0
        z = ones(size(a,1),size(a,2));
    else
        z = zeros(size(a,1),size(a,2));
    end
end