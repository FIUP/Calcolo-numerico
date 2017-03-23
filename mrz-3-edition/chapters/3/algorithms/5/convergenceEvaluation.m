%{
 % Copyright 2017 Stefano Fogarollo
 %
 % Licensed under the Apache License, Version 2.0 (the "License");
 % you may not use this file except in compliance with the License.
 % You may obtain a copy of the License at
 %
 % http://www.apache.org/licenses/LICENSE-2.0
 %
 % Unless required by applicable law or agreed to in writing, software
 % distributed under the License is distributed on an "AS IS" BASIS,
 % WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 % See the License for the specific language governing permissions and
 % limitations under the License.
%}


function [x, p, c, numberOfIterations] = convergenceEvaluation (tolerance, maxIterations)
% CONVERGENCEEVALUATION Finds the convergence order of a sample method (in
% this case the secant method). Moreover it returns the error reduction
% factor.
% More in detail, we use a sample function (i.e f(x) = a - 1/x, find a
% solution of the equation f(x) = 0, and meanwhile we compute the
% convergence order and error reduction factor.
%
%  [x, p, c, numberOfIterations] = convergenceEvaluation (tolerance, maxIterations)
%
% Input:
% tolerance - epsilon at which stop method (i.e when |f(xn) - 0| <
%             epsilon)
% maxIterations - max number of iterations to execute
%
% Output:
% x - solution of the equation
% p - convergence order
% c - error reduction factor
% numberOfIterations - number of iterations executed before getting a solution

numberOfIterations = 0;
deltaDiff = tolerance * 2;  % initialize diff
a = 10^(-10);  % value of a in the equation f(x) = a - 1/x
xN3 = 0;  % x_{n-3}, i.e the previous of the previous of the previous solution
xN2 = 0;  % x_{n-2}, i.e the previous of the previous solution
xN1 = 0;  % x_{n-1}, i.e the previous solution we computed, the second starting point
xN = a;  % x_n, i.e the current value of solution, the starting point
p = -1;  % null values
c = -1;
lastP = -1;  % null values
lastC = -1;
while deltaDiff >= tolerance && numberOfIterations < maxIterations
    numberOfIterations = numberOfIterations + 1;  % increase counter
    
    %% Compute secant method iteration
    x = xN * (2 - a * xN);
    deltaDiff = abs(x - xN);
    
    %% Update previous values
    xN3 = xN2;
    xN2 = xN1;
    xN1 = xN;
    xN = x;
    
    %% Compute convergence order
    if deltaDiff < tolerance || numberOfIterations >= maxIterations % last iteration -> calculate p, c
        p = lastP;
        c = lastC;
    else
        lastP = log(abs(xN - xN1) / abs(xN1 - xN2)) / log(abs(xN1 - xN2) / abs(xN2 - xN3));
        lastC = (abs(xN - xN1) / abs(xN1 - xN2)) ^ p;
    end
end