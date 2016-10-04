
function [BF, lm] = modelBFcompDE(predictors,response)

%Funtion to calculate the BayesFactor of a linear model vs. the null, from
%a predictor matrix X and a response vector y.
% 
%  [BF, lm] = modelBFcompDE(predictors,response)
% 
%     Input:
%         predictors = mxn matrix of predictive variables
%         response = m length column vector of response variable
%         
%     Output:
%         BF = Bayes factor estimate of linear model vs null
%         lm = results of traditional linear model

    X = predictors;
    Xn = zeros(size(X));
    for ii = 1:size(X,2)
        Xn(:,ii) = (X(:,ii)-min(X(:,ii)))/(max(X(:,ii))-min(X(:,ii)));
    end
    y = response;

    lm = fitlm(Xn,y);

    p = length(lm.PredictorNames);
    R2 = lm.Rsquared.Ordinary;
    N = lm.NumObservations;

    BF = BFGaussQuadDE(N,R2,p,sqrt(2)/4);

    
end
