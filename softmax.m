function z = softmax(y)
%applico softmax all'output della rete
%y: output della rete

    z = exp(y)./sum(exp(y),1);    
end
