
function [bf, lm] = BFall_reg(predictors,response)

%Funtion to conduct model selection using Bayes factor analysis
% 
%  [BF, lm] = BFall_reg(predictors,response)
% 
%     Input:
%         predictors = mxn matrix of predictive variables
%         response = m length column vector of response variable
%         
%     Output:
%         BF = Structure containing Bayes factor estimates for each model
%         lm = Structure containing results of traditional linear models

    NumPred = size(predictors,2);

    mods = permMods(NumPred); 

    for i = 1:length(mods); 
        [bfvals(i), lm(i).m] = modelBFcompDE(predictors(:,mods{i}),response); 
    end; 

    bfvals = double(bfvals)';
    
    bf.bf = bfvals;
    bf.mods = mods;
    for j = 1:length(bf.bf)
        bf.summary(j).predictors = bf.mods{j};
        bf.summary(j).bf = bf.bf(j);
    end

end