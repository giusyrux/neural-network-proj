function T = getTargetsFromLabels(label)
%estraggo i valori dalle label

    len = length(label); %lunghezza array
    uniqueVal = unique(label); %elimino i duplicati
    dimUnique = length(uniqueVal); %lunghezza array senza duplicati
    T = zeros(dimUnique,len); %inizializzo T
    
    for n=1:len
        
        T(label(n) == uniqueVal,n)=1;
    end
end
