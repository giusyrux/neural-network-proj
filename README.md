# Neural Network 
## Description
Low-Level implementation of a shallow neural network and training on the MNIST Dataset for digits classification. The weight update algorithm used is Resilient Backpropagation [RProp](https://paginas.fe.up.pt/~ee02162/dissertacao/RPROP%20paper.pdf). The several trainings differ by the number of layers (1 to 5), the number of nodes and the use of sigmoid or ReLu as the activation function. 

### `main.m`
As the file name suggests, this is the main file where the dataset is prepared, the neural network is created and the train begins. The dataset has been divided into the training set (5000 images), the validation set (2500 images) and the test set (2500 images).

### `createLayers.m`
This function is invocated in `createNet.m` returning the network's layers. Beyond the creation of network layers, the weights for each layer are casually initialized randomly with a value close to zero.

`layers(i).W = randn(layers(i).size(2),layers(i).size(1))*sigma;` with sigma=0.1 

The update steps (which will be needed to update the weights with RProp) are initialized randomly by multiplying by a deltaZero=0.1 as suggested [here](https://paginas.fe.up.pt/~ee02162/dissertacao/RPROP%20paper.pdf).

### Error functions
The error functions considered are the Sum of Squares and Cross Entropy.

### RProp parameters
For the increment and decrement of updates steps, as suggested in the [paper](https://paginas.fe.up.pt/~ee02162/dissertacao/RPROP%20paper.pdf), two hyperparameters are set
:
```
etaP = 1.2; % etaP > 1 to increment the update step delta(i,j)
etaN = 0.5; % 0 < etaN < 1 to decrement the update step delta(i,j)
deltaMax = 0.00025;
deltaMin = 10^(-6);
```

## Train
![image](https://cdn.discordapp.com/attachments/1080216725599027364/1193947270735995051/schema.png?ex=65ae910b&is=659c1c0b&hm=9a96cbebb60d7d0d43f78710e48ee2ee1ac5ecb9fca2ea51c87f3bff5844bd5c&)

### Authors
[Giuseppina Russo](https://github.com/giusyrux)

[cappadavide](https://github.com/cappadavide)

_This README file will be updated with more details_
