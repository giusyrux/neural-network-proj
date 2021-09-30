function sm = softmax(z)
%applico softmax all'output della rete
%y: output della rete
    sm = exp(z)./sum(exp(z),2) ;
    %sm = exp(z)/sum(exp(z)) ;
end
