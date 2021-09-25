function [err, newNet, err_val]=train(net,X,T,X_val,T_val,loss,epochs)
    err=zeros(1,epochs);
    err_val=zeros(1,epochs);
    y_val=predict(miaNet,X_val);
    min_err=sumOfSquares(y_val,T_val);
    newNet=net;

    for epoch=1:epochs
        net.layers = forwardProp(net.layers,X);
        net.layers = backProp(net.layers,gradOutput);
        % RPROP
        gradOutput = computeCost(y,T,params.cost);
        
        y=predict(net,X,params.softmax);
        y_val=predict(net,X_val,params.softmax);
        
        if loss=="ce"
            err(epoch)=crossEntropy(y,T);
            err_val(epoch)=crossEntropy(y_val,T_val);
        else
            if loss=="mse"
                err(epoch)=sumOfSquares(y,T);
                err_val(epoch)=sumOfSquares(y_val,T_val);
            end
        end
        disp(['err train:' num2str(err(epoch)) ' err val:' num2str(err_val(epoch))]);
        
        if err_val(epoch)< min_err
            min_err=err_val(epoch);
            newNet=net;
        end
    end
    
   
end