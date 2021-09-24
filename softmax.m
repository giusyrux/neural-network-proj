function z=softmax(y)
    z= exp(y) / sum(exp(y)) ;
end