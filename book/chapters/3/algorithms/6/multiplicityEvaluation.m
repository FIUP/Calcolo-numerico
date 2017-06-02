function [x, C, multiplicity, numberOfIterations] = multiplicityEvaluation(f, fDerivative, startPoint, tolerance, maxIterations)
% MULTIPLICITYEVALUATION Evaluates the multiplicity of the solution with
% the Newton method.
%
% [x1, x2] = parabolaSolver (a, b, c)
%
% Given a parabola equation like ax² + bx + c = 0
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
% x - the solution of the equation f(x) = 0
% C - error asyntotic constant
% multiplicity - multiplicity of the solution
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

C = 0;
multiplicity = 0;
numberOfIterations = 0;
derivativeZero = false;
x = startPoint;
xN1 = x * 2;  % x_{n-1}
xN2 = x * 3;  % x_{n-2}
deltaDiff = tolerance * 2;  % initialize diff
while deltaDiff >= tolerance && numberOfIterations < maxIterations && ~derivativeZero
    derivativeValue = feval(fDerivative, x);
    if derivativeValue == 0
        derivativeZero = true;
    else
        deltaDiff = - feval(f, x) / derivativeValue;
        xN2 = xN1;  % get next term of sequence
        xN1 = x;
        x = x + deltaDiff;
        deltaDiff = abs(deltaDiff);
    end
    
    C = abs(x - xN1) / abs(xN1 - xN2);
    numberOfIterations  = numberOfIterations + 1;  % increase counter
end

multiplicity = 1 / (1 - C);