%% Parametri
parameters;

%% Estrazione dataset
files = ["mnist/t10k-images-idx3-ubyte" "mnist/t10k-labels-idx1-ubyte"];
[X,T] = prepareDataset(files);

%% SHUFFLE
ind=randperm(size(X,2));
X=X(:,ind);
T=T(:,ind);

%% SPLIT TRAIN, VALIDATION, TEST SET
percentTrain = size(X,2)*params.percentTrain;
percentValidation = size(X,2)*params.percentValidation;
offset = percentTrain+percentValidation;
XTrain= X(:,1:percentTrain); % 5000
TTrain= T(:,1:percentTrain);

XVal=X(:,percentTrain+1:offset); % 2500
TVal= T(:,percentTrain+1:offset);

XTest=X(:,offset+1:end); %2500
TTest= T(:,offset+1:end);

%%
net = createNet(params,size(XTrain,1),size(TTrain,1));
disp(net);
