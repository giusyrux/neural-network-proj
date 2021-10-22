function err = sumOfSquares(y,t)
%calcolo dell'errore tramite sum-of-squares
%y: output della rete
%t: label del DS

    err = 0.5*sum(sum((y-t).^2));
end
