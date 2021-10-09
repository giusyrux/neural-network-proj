function [err, newNet, errVal] = train(net,XTrain,TTrain,XVal,TVal,loss,epochs,hassoftmax)
%fase di learning
%ritorno la rete e l'errore per il train e per il validation set
%net: la rete
%XTrain, TTrain, XVal, TVal: set di train e validation
%loss: funzione di errore
%epochs: numero di epoche

    %inizializzo gli errori e lo score
    err = zeros(1,epochs);
    errVal = zeros(1,epochs);
    score = zeros(1,epochs);
    
    %predico l'output e valuto l'errore di predizione
    yVal = predict(net,XVal,hassoftmax);
    minErr = crossEntropy(yVal,TVal);
    newNet = net;

    for epoch=1:epochs
      
        net.layers = forwardProp(net.layers,XTrain); %imposto i parametri
        y = net.layers(size(net.layers,2)).z;
        
        gradOutput = computeCost(y,TTrain,loss,hassoftmax); %calcolo derivata errore
        
        net.layers = backProp(net.layers,gradOutput,XTrain); %calcolo gradiente
        net.layers = resilientProp(net.layers,epoch); %aggiorno i parametri
        
        %predico l'output
        y = predict(net,XTrain,hassoftmax);
        yVal = predict(net,XVal,hassoftmax);
        
        %calcolo l'errore di predizione
        if loss == "ce"
            
            err(epoch) = crossEntropy(y,TTrain);
            errVal(epoch) = crossEntropy(yVal,TVal);
        else
            
            err(epoch) = sumOfSquares(y,TTrain);
            errVal(epoch) = sumOfSquares(yVal,TVal);
        end
        
        score(epoch) = accuracy(yVal,TVal); %calcolo l'accuracy a ogni epoca
        
        disp(['Epoca: ' num2str(epoch)]);
        disp(['Accuracy: ' num2str(score(epoch))]);
        disp(['Errore di training: ' num2str(err(epoch)) ' Errore di validazione:' num2str(errVal(epoch))]);
        
        if errVal(epoch) < minErr
            
            minErr = errVal(epoch);
            newNet = net; %salvo la rete con errore minimo
        end
    end
end