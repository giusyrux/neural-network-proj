function []=train(net,x,y)
    net.layers = forwardProp(net.layers,x);
    gradOutput = computeCost(y,t,params.cost);
    net.layers = backProp(net.layers,gradOutput);
end