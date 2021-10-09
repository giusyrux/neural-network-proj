function z = sigmoide(a)
%calcolo output strato interno (z=f(a)) con sigmoide come funzione di attivazione

    z = 1./(1+exp(-a));
end