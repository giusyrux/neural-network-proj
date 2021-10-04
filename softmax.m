function sm = softmax(z)
%applico softmax all'output della rete
%y: output della rete
    %Ignora z = z - max(z,[],2);
    sm = exp(z)./sum(exp(z),1);
    %sm = exp(z)/sum(exp(z));
end
