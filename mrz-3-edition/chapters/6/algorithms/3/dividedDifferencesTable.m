function [t] = dividedDifferencesTable(x, y)
% DIVIDEDDIFFERENCESTABLE: Calculates divided differences table of nodes.
%
%  [t] = dividedDifferencesTable(x, y)
%
% Input:
% x - vector of x point where function is known
% y - f(x)
%
% Output:
% t - divided differences table of nodes. Each row contains the differences
%     such that t(i, j) is t-he j-th difference starting from the i-th
%     value.

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

n = length(x);  % nodes count
t = zeros(n, n);  % zero all values

for row = 1 : n
    t(row, 1) = y(row);  % first difference is the value f(x)
end

for column = 2 : n
    for row = 1 : n - column + 1
        diffRows = t(row, column - 1) - t(row + 1, column - 1);
        diffXs = x(row) - x(row + column - 1);
        t(row, column) = diffRows / diffXs;  % dp
    end
end