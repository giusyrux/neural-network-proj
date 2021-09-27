function err = sumOfSquares(y,t)
%calcolo dell'errore tramite sum-of-squares
%y: output della rete
%t: label del DS

    err = (1/2)*sum(sum((y-t).^2));
end
