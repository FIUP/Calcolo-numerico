function [x, numberOfIterations] = halley(f, fDerivative, f2Derivative, startPoint, tolerance, maxIterations)
% HALLEY: Finds a solution of f(x) = 0 with Halley method.
%
%  [x, numberOfIterations, derivativeZero] = multipleRootsNewton(f, fDerivative, f2Derivative, startPoint, tolerance, maxIterations, r)
%
% Input:
% f - 'f' function in the equation 'f(x) = 0'
% fDerivative - derivative of f
% f2Derivative - derivative of derivative of f
% startPoint - starting point of method
% tolerance - epsilon at which stop method (i.e when |f(xn) - 0| <
%             epsilon)
% maxIterations - max number of iterations to execute
%
% Output:
% x - approximation of solution of 'f(x) = 0'
% numberOfIterations - number of iterations executed before getting
%                      solution

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

numberOfIterations = 0;
x = startPoint;
deltaDiff = tolerance * 2;  % initialize diff
while deltaDiff >= tolerance && numberOfIterations < maxIterations
    fx = feval(f, x);  % evaluate f(x), f'(x), f''(x)
    fDx = feval(fDerivative, x);
    fDDx = feval(f2Derivative, x);
    
    deltaDiff = - 2 * (fx * fDx) / (2 * (fDx ^ 2) - fx * fDDx);
    x = x + deltaDiff;
    deltaDiff = abs(deltaDiff);
    numberOfIterations  = numberOfIterations + 1;  % increase counter
end