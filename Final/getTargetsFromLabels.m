function t = getTargetsFromLabels(label)
%estraggo i valori dalle label

    len = length(label); %lunghezza array
    uniqueVal = unique(label); %elimino i duplicati
    dimUnique = length(uniqueVal); %lunghezza array senza duplicati
    t = zeros(dimUnique,len); %inizializzo t
    
    for n=1:len
        
        t(label(n) == uniqueVal,n)=1;
    end
end