function score = accuracy(y,t)

    scores = zeros(1,size(y,2)); %inizializzo gli score
    
    %fisso una soglia di valutazione
    y(y>=0.5)=1;
    y(y<0.5)=0;
    
    for img=1:size(y,2)
        for class=1:size(y,1)
            
            if y(class,img) == t(class,img)
                scores(img) = 1;
            else
                scores(img) = 0;
            end
        end
    end
    
    score = mean(scores); %faccio la media degli score
end