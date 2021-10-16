parameters;

neuronsChoices = [randi([104 150],1,3);randi([87 103],1,3);randi([61 86],1,3);randi([31 60],1,3);randi([1 30],1,3)];
disp(num2str(neuronsChoices));
act = ["relu" "sigmoide"];
nHiddenLayers = 5;
choiceNeurons= 3;
oldScore = 0;
bestParams = struct;

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
           %legend({'errore di training','errore di validazione'},'Location','northeast');
           set(gca, 'XTick', (0:10:params.epochs));
           set(gca, 'xlim', [0 params.epochs]);
           fileName = totalLayers + "_" + actFunction + "_" + numberNeurons + ".jpg";
           directoryName = 'C:\Users\Giusy\Desktop\UNI\I anno\Esami annuali\Machine Learning\Deep Learning\Progetto\neural-network\images\';
           saveas(gcf,directoryName + fileName);
           hold off;
       end
   end
   
end
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