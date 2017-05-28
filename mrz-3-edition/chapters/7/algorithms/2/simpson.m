function [I] = simpson(f, a, b, m)
% SIMPSON: Finds the value of integral(f) from a to b using the
% Simpson rule with m intervals.
%
%  [I] = simpson(f, a, b, m)
%
% Input:
% f - function to integrate
% a - start point
% b - end point
% m - number of intervals to create
%
% Output:
% I - approximation of solution of 'f(x) = x'
% numberOfIterations - number of integral(f) from a to b
% NEWTON: Finds a solution of f(x) = 0 with Newton method.
%
%  [x, numberOfIterations, derivativeZero] = newton(f, fDerivative, startPoint, tolerance, maxIterations)

% Copyright 2017 Stefano Fogarollo
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
%
% http://www.apache.org/licenses/LICENSE-2.0
%
% Unless require4d by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.

if mod(m, 2) ~= 0  % m is odd
    error('Cannot integrate using Simpson rule because #intervals is odd');
else
    h = (b - a) / m;  % step
    I = feval(f, a) + feval(f, b);  % starting value
    for i = 1 : 2 : m - 1  % step 2
        x = a + i * h;
        I = I + 4 * feval(f, x);
    end
    for i = 2 : 2 : m - 2  % step 2
        x = a + i * h;
        I = I + 2 * feval(f, x);
    end
    I = h * I / 3;
end