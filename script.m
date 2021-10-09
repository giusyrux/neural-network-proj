
parameters;

neuronsChoices = [randi([104 150],1,3);randi([87 103],1,3);randi([61 86],1,3);randi([31 60],1,3);randi([1 30],1,3)];
disp(num2str(neuronsChoices));
act = ["relu" "sigmoide"];
nHiddenLayers = 5;
choiceNeurons= 3;


for totalLayers=1:nHiddenLayers
   for actFunction=1:length(act)
       for numberNeurons=1:choiceNeurons
           neurons = zeros(1,totalLayers);
           disp(["Strati interni: " num2str(totalLayers) "F. attivazione: " act(actFunction) "Numero neuroni: " num2str(numberNeurons)]);
           for layer=1:totalLayers
                neurons(layer) = neuronsChoices(layer,numberNeurons);
                params.neurons = neurons;
                params.nLayers = totalLayers+1;
                params.act(layer) = act(actFunction);
           end
           [newNet, err, errVal, score] = main(params);
           % creazione file dei plot
       end
   end
end
