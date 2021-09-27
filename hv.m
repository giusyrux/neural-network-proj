function z = hv(a)
%calcolo output strato interno (y=f(a)) con heaviside come funzione di attivazione

    if a>0
        z = 1;
    else
        z = 0;
    end
end
