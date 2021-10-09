%estraggo i dati dal DS
function [newNet, err, errVal, score] = main(params) 
    files = ["t10k-images-idx3-ubyte" "t10k-labels-idx1-ubyte"];
    [X,T] = prepareDataset(files);

    %prelevo i dati in modo random
    ind = randperm(size(X,2));
    X = X(:,ind);
    T = T(:,ind);

    %divido in train, test e validation set
    percentTrain = size(X,2)*params.percentTrain;
    percentValidation = size(X,2)*params.percentValidation;
    offset = percentTrain+percentValidation;

    XTrain = X(:,1:percentTrain); % 5000 per il train
    TTrain = T(:,1:percentTrain);

    XVal =X(:,percentTrain+1:offset); % 2500 per il validation
    TVal = T(:,percentTrain+1:offset);

    XTest = X(:,offset+1:end); %2500 per il test
    TTest = T(:,offset+1:end);

    %creo la rete
    net = createNet(params,size(XTrain,1),size(TTrain,1));

    %addestro la rete
    [err, newNet, errVal] = train(net,XTrain,TTrain,XVal,TVal,params.cost,params.epochs,params.softmax);

    %effettuo le predizioni e valuto l'accuracy della rete
    y = predict(newNet,XTest,params.softmax);
    score = accuracy(y,TTest);

    disp(['Accuracy è: ' num2str(score)]);
end