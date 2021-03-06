BFDE package:

This package implements Bayes factor estimation for both a single linear model, as well as the permutation of all models producible from a given set of predictor variables. 

The only functions necessary to utilize the package are BFsingle_reg.m and BFall_reg.m which are described below. The remaining functions perform the backend functionality that produces the Bayes factor estimates. In general I would recommend keeping all the files together, but as long as all files are somewhere on your Matlab search path both master scripts should run fine. 

Background:

"The Bayes factor is the relative evidence in the data. The evidence in the data favors one hypothesis, relative to another, exactly to the degree that the hypothesis predicts the observed data better than the other." - Richard Morey

Background reading on Bayes factor: http://bayesfactor.blogspot.com/2014/02/the-bayesfactor-package-this-blog-is.html

Literature/citation:

Rouder, J. N. and Morey, R. D. (2013) Default Bayes Factors for Model Selection in Regression, Multivariate Behavioral Research, 47, pp. 877-903

Liang, F. and Paulo, R. and Molina, G. and Clyde, M. A. and Berger, J. O. (2008). Mixtures of g-priors for Bayesian Variable Selection. Journal of the American Statistical Association, 103, pp. 410-423


Functions:

BFsingle_reg - calculates the Bayes factor for a single specified linear model.

%     [BF, lm]  =  BFsingle_reg(predictors,response)
% 
%     Input:
%         predictors = mxn matrix of predictive variables
%         response = m length column vector of response variable
%         
%     Output:
%         BF = Bayes factor estimate of linear model vs null
%         lm = results of traditional linear model


BFall_reg - calculates the Bayes factor for all possible models comprised of the predictors provided.

%     [BF, lm]  =  BFall_reg(predictors,response)
% 
%     Input:
%         predictors = mxn matrix of predictive variables
%         response = m length column vector of response variable
%         
%     Output:
%         BF = Structure containing Bayes factor estimates for each model
%         lm = Structure containing results of traditional linear models


