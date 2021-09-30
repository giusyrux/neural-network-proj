function score = accuracy(y,t)
scores = zeros(1,size(y,2));
disp(scores);
y(y>0.8)=1;
disp(y);
for i=1:size(y,1)
    for j=1:size(y,2)
        if(y(i,j)==t(i,j))
            scores(i) = 1;
        else
            scores(i) = 0;
        end
    end
end
score = mean(scores);

