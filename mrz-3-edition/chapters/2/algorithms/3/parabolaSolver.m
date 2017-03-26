function [x1, x2] = parabolaSolver (a, b, c)
% PARABOLASOLVER Solves parabola equation and returns solutions
%
% [x1, x2] = parabolaSolver (a, b, c)
%
% Given a parabola equation like ax² + bx + c = 0
%
% Input:
% a - coefficient of x²
% b - coefficient of x
% c - known term
%
% Output:
% x1 - first solution
% x2 - second solution

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

if a == 0
    if b == 0
        if c == 0
            x1 = NaN;  % 0 + 0 + 0 = 0 ... not determined
            x2 = NaN;
        else
            x1 = NaN;  % 0 + 0 + c = 0 ... impossible!
            x2 = NaN;
        end
    else
        x1 = -c / b;  % bx + c = 0 ... 1-deg equation
        x2 = x1;
    end
else
    delta = b ^ 2 - 4 * a * c;  % calculate D
    if delta < 0
        x1 = NaN;  % no real solutions
        x2 = NaN;
    elseif delta == 0
        x1 = -b / (2 * a);  % 2 equals solutions
        x2 = x1;
    else
        x1 = (-b - sqrt(delta)) / (2 * a);  % standard 2-deg equation
        x2 = (-b + sqrt(delta)) / (2 * a);
    end
end