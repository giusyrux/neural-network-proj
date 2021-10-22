parameters;

neuronsChoices = [randi([104 150],1,3);randi([87 103],1,3);randi([61 86],1,3);randi([31 60],1,3);randi([1 30],1,3)];

disp(num2str(neuronsChoices));
act = ["relu" "sigmoide"];
nHiddenLayers = 5;
choiceNeurons= 3;
oldScore = 0;
currentPath = convertCharsToStrings(pwd);
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
           if oldScore < score
               oldScore = score;
               bestParams.layers = totalLayers;
               bestParams.act = act(actFunction);
               bestParams.choice = neuronsChoices(:,numberNeurons);
           end
          % creazione file dei plot
           figure('visible','off');
           hold on;
           plot((1:1:params.epochs),err,'-*',(1:1:params.epochs),errVal,'-o');
           title(sprintf("Grafico con %d strati, %s e nodi interni %s",totalLayers,act(actFunction),num2str(neuronsChoices(1:totalLayers,numberNeurons)')));
           xlabel('Epochs');
           ylabel('Error');
           set(gca, 'XTick', (0:10:params.epochs));
           set(gca, 'xlim', [0 params.epochs]);
           fileName = totalLayers + "_" + actFunction + "_" + numberNeurons + ".jpg";
           directoryName = currentPath + '\images\';
           saveas(gcf,directoryName + fileName);
           hold off;
       end
   end   
end
fprintf("Migliori parametri: %d strati, %s e nodi interni %s",bestParams.layers, bestParams.act, num2str((bestParams.choice))');

