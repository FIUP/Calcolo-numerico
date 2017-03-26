function [x, numberOfIterations] = multipleRootsNewton(f, fDerivative, startPoint, tolerance, maxIterations, r)
% MULTIPLEROOTSNEWTON: Finds a solution of f(x) = 0 with Newton method.
%
%  [x, numberOfIterations, derivativeZero] = multipleRootsNewton(f, fDerivative, startPoint, tolerance, maxIterations, r)
%
% Input:
% f - 'f' function in the equation 'f(x) = 0'
% fDerivative - derivative of f
% startPoint - starting point of method
% tolerance - epsilon at which stop method (i.e when |f(xn) - 0| <
%             epsilon)
% maxIterations - max number of iterations to execute
% r - multiplicity of the solution
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
    deltaDiff = - r * feval(f, x) / feval(fDerivative, x);
    x = x + deltaDiff;
    deltaDiff = abs(deltaDiff);
    numberOfIterations  = numberOfIterations + 1;  % increase counter
end