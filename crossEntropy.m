function err = crossEntropy(y,t)
%calcolo dell'errore tramite cross-entropy
%y: output della rete
%t: label del DS

    err = (-sum(sum(t .* log(y),2)));
end
