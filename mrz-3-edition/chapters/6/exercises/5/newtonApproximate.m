function [yVal] = newtonApproximate(x, y, xVal)
% NEWTONAPPROXIMATE given vectors x, y finds approximation of yVal using
% Newton method.
%
%  [yApproximation] = newtonApproximate(x, y, xVal)
%
% Input:
% x - vector of x point where function is known
% y - f(x)
% xVal - x - vector of x point where function is to approximate
%
% Output:
% yVal - approximation of f(xVal)

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

divDiffTable = dividedDifferencesTable(x, y);  % divided differences table
n = length(x);  % number of nodes
yVal = [];  % list of approximations
for p = 1 : length(xVal)  % evaluate P(x) for each point
    yP = y(1);
    for i = 2 : n
        prod = 1;  % compute (x - xj)
        for j = 1 : i - 1
            prod = prod * (xVal(p) - x(j));
        end
        yP = yP + prod * divDiffTable(1, i);  % i-th divided difference
    end
    
    yVal = [yVal yP];
end