function [err, net, errVal] = train(net,XTrain,TTrain,XVal,TVal,loss,epochs,softmax)
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
    yVal = predict(net,XVal,softmax);
    minErr = crossEntropy(yVal,TVal);
    newNet = net;

    for epoch=1:epochs
      
        net.layers = forwardProp(net.layers,XTrain,softmax); 
        y = net.layers(size(net.layers,2)).z;
        gradOutput = computeCost(y,TTrain,loss,softmax); %calcolo derivata errore
        net.layers = backProp(net.layers,gradOutput,XTrain); %calcolo gradiente
        %net.layers = classicGradientDescent(net.layers);
        net.layers = rprop(net.layers,epoch);
        
        %predico l'output
        y = predict(net,XTrain,softmax);
        yVal = predict(net,XVal,softmax);
        %disp('y');
        %disp(y(:,1)');
        
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
            %disp('Sono entrato');
            minErr = errVal(epoch);
            newNet = net; %salvo la rete con errore minimo
        end
    end
end
