function [x, numberOfIterations] = steffensen (f, startPoint, tolerance, maxIterations)
% STEFFENSEN Calculates solution of f(x) = x using Steffensen method.
%
% [x, numberOfIterations] = steffensen (f, startPoint, tolerance, maxIterations)
%
% Input:
% f - 'f' function in the equation 'f(x) = x'
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
    u0 = x;  % build aitken list
    u1 = feval(f, u0);
    u2 = feval(f, u1);
    xNew = aitken([u0 u1 u2]);
    deltaDiff = abs(x - xNew);
    x = xNew;
    numberOfIterations  = numberOfIterations + 1;  % increase counter
end