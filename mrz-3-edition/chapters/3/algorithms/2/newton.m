function [x, numberOfIterations, derivativeZero] = newton(f, fDerivative, startPoint, tolerance, maxIterations)
% NEWTON: Finds a solution of f(x) = 0 with Newton method.
%
%  [x, numberOfIterations, derivativeZero] = newton(f, fDerivative, startPoint, tolerance, maxIterations)
%
% Input:
% f - 'f' function in the equation 'f(x) = 0'
% fDerivative - derivative of f
% startPoint - starting point of method
% tolerance - epsilon at which stop method (i.e when |f(xn) - 0| <
%             epsilon)
% maxIterations - max number of iterations to execute
%
% Output:
% x - approximation of solution of 'f(x) = 0'
% numberOfIterations - number of iterations executed before getting
%                      solution
% derivativeZero - boolean to check whether function has stopped or not
%                  because of a f'(x) = 0

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
derivativeZero = false;
x = startPoint;
deltaDiff = tolerance * 2;  % initialize diff
while deltaDiff >= tolerance && numberOfIterations < maxIterations && ~derivativeZero
    derivativeValue = feval(fDerivative, x);
    if derivativeValue == 0
        derivativeZero = true;
    else
        deltaDiff = - feval(f, x) / derivativeValue;
        x = x + deltaDiff;
        deltaDiff = abs(deltaDiff);
        numberOfIterations  = numberOfIterations + 1;  % increase counter
    end
end