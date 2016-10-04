
function mods = permMods(N)

%Function to create a full combination of possible predictor variables

    counter = 1; 

    for i = 1:1:N; 
        c = combnk(1:1:N,i); 
        c1 = sortrows(c);
        for j = 1:size(c1,1); 
            mods{counter} = c1(j,:);
            counter = counter+1;
        end 
    end

end