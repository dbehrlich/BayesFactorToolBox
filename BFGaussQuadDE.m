function BayesFactor = BFGaussQuadDE(N,R2,p,varargin)

%Function to calculate Bayes Factor of regression model using Gaussian Quadrature
%
%   BayesFactor = BFGaussQuadDE(N,R2,p,s)
%
%   Inputs:
%       N = Sample Size
%       R2 = The square root of the pearson correlation coefficient
%       p = Number of model predictors
%       s = Shape parameter to designate cauchy prior. Default = 1
%     
%    Ouputs:
%       BayesFactor = Estimated Bayes factor


nargin = length(varargin);

if nargin>0
    s = varargin{1};
else
    s = 1;
end

bayesFactorFunc = ['((1+g)^((' num2str(N) '-' num2str(p) '-1)/2))*((1+g*(1-' num2str(R2) '))^(-(' num2str(N) '-1)/2))*(((' num2str(s) '*sqrt(' num2str(N) '/2)/gamma(1/2))*g^(-3/2)*exp(-' num2str(N) '*(' num2str(s) '^2)/(2*g))))'];
range = 'g=0..infinity';
quadMethod = 'GaussLegendre = 16';

BayesFactor = feval(symengine,'numeric::quadrature', ...
    bayesFactorFunc, ...
    range, ...
    quadMethod);

end