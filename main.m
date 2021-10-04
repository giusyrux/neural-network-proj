parameters; %inizializzo i parametri della rete

%estraggo i dati dal DS
files = ["mnist/t10k-images-idx3-ubyte" "mnist/t10k-labels-idx1-ubyte"];
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
net = createNet(params,size(XTrain,1),size(TTrain,1));
[err, newNet, errVal] = train(net,XTrain,TTrain,XVal,TVal,params.cost,params.epochs,params.softmax);
disp(TTest(:,1)');
y = predict(newNet,XTest(:,1),params.softmax);
disp(y');

%%%%%%%---------------------Creazione Seno---------%%%%%%%
% % trainingset = randn(1,600);
% % targets = sin(trainingset);
% % validset = randn(1,600);
% % tvalidset = sin(validset);
% % testset = randn(1,10);
% % testtargets = sin(testset);

% %ind = randperm(500);
% 
% %trainingset = trainingset(:,ind);
% %targets = targets(:,ind);

% % %creo la rete net
% % net = createNet(params,size(trainingset,1),size(targets,1));
% % [err, newNet, errVal] = train(net,trainingset,targets,validset,tvalidset,params.cost,params.epochs,params.softmax);
% % disp(targets(:,1));
% % y= predict(newNet,trainingset(:,1),params.softmax);
% % disp(y);

% disp(testtargets(:,1));
% y= predict(newNet,testset(:,1),params.softmax);
% disp(y);