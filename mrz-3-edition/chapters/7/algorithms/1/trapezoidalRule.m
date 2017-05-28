function [I] = trapezoidalRule(f, a, b, m)
% TRAPEZOIDALRULE: Finds teh value of integral(f) from a to b using the
% Trapezoidal rule with m intervals.
%
%  [I] = trapezoidalRule(f, a, b, m)
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


h = (b - a) / m;  % step
I = feval(f, a) + feval(f, b);  % starting value
for i = 1 : m - 1
    x = a + i * h;
    I = I + 2 * feval(f, x);
end
I = h * I / 2;