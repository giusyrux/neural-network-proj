function [err, newNet, errVal] = train(net,XTrain,TTrain,XVal,TVal,loss,epochs,params)
%fase di learning
%ritorno la rete e l'errore per il train e per il validation set
%net: la rete
%XTrain, TTrain, XVal, TVal: set di train e validation
%loss: funzione di errore
%epochs: numero di epoche

    %inizializzo gli errori
    err = zeros(1,epochs);
    errVal = zeros(1,epochs);
    
    %predico l'output e valuto l'errore di predizione
    yVal = predict(net,XVal,params.softmax);
    minErr = sumOfSquares(yVal,TVal);
    newNet = net;

    for epoch=1:epochs
        
        net.layers = forwardProp(net.layers,XTrain); %aggiorno valori
        net.layers = backProp(net.layers,gradOutput,XTrain); %calcolo gradiente
        % RPROP
        gradOutput = computeCost(y,TTrain,params.cost,params.softmax); %calcolo derivata errore
        
        %predico l'output
        y = predict(net,XTrain,params);
        yVal = predict(net,XVal,params);
        
        %calcolo l'errore di predizione
        if loss == "ce"
            
            err(epoch) = crossEntropy(y,TTrain);
            errVal(epoch) = crossEntropy(yVal,TVal);
        else
            
            err(epoch) = sumOfSquares(y,TTrain);
            errVal(epoch) = sumOfSquares(yVal,TVal);
        end
        
        disp(['Errore di training: ' num2str(err(epoch)) ' Errore di validazione:' num2str(errVal(epoch))]);
        
        %trovo l'epoca in cui l'errore è minimo -QUA POSSO METTERE EARLY ST
        if errVal(epoch)< minErr
            
            minErr = errVal(epoch);
            newNet = net; %salvo la rete con errore minimo
        end
    end
end
