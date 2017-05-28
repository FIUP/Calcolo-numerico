function [I] = romberg(f, a, b, m, n)
% SIMPSON: Finds the value of integral(f) from a to b using the
% Romberg rule with m intervals.
%
%  [I] = romberg(f, a, b, m, n)
%
% Input:
% f - function to integrate
% a - start point
% b - end point
% m - number of intervals to create
% n - number of initial values of the first column of integral values
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

T = zeros(n, n);  % initialize table
for i = 1 : n  % fill first column
    T(i, 1) = trapezoidalRule(f, a, b, m);
    m = 2 * m;
end
for k = 1 : n - 1
    for i = 0 : n - k - 1
        T(i, k + 1) = (4 ^ (k + 1) * T(i + 1, k) - T(i, k)) / (4 ^ (k + 1) - 1);
    end
end