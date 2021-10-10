parameters;

neuronsChoices = [randi([104 150],1,3);randi([87 103],1,3);randi([61 86],1,3);randi([31 60],1,3);randi([1 30],1,3)];
disp(num2str(neuronsChoices));
act = ["relu" "sigmoide"];
nHiddenLayers = 3;
choiceNeurons= 3;
bestParams = [];
oldScore = 0;

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
               bestParams(1) = totalLayers;
               bestParams(2) = actFunction;
               bestParams(3) = numberNeurons;
           end
           % creazione file dei plot
       end
   end
   
end
disp(num2str(bestParams));
% figure;
% figura = plot(X,Y);
% set(gca, 'XTick', [0 5])
% set(gca, 'XTick', [0 1 2 3 4 5])
% set(gca, 'xlim', [0 5])
% saveas(gcf,'ehsapessi.jpg')
% title('Line Plot of Sine and Cosine Between -2\pi and 2\pi')
% xlabel('-2\pi < x < 2\pi') 
% ylabel('Sine and Cosine Values')
% legend({'y = sin(x)','y = cos(x)'},'Location','southwest')