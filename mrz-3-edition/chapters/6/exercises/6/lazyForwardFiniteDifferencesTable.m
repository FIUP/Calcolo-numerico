function [t] = lazyForwardFiniteDifferencesTable(x, y, prevTable)
% LAZYFORWARDFINITEDIFFERENCESTABLE: Calculates forward finite differences
% table of nodes in the binomial way. The algorithm supposes that, in case
% of a existent previous table, the xs to add are > than the xs of the
% previous table.
%
%  [t] = lazyForwardFiniteDifferencesTable(x, y, prevTable)
%
% Input:
% x - vector of x point where function is known; |xi - xj| should be the
%     same for every i,j in length(x)
% y - f(x)
% prevTable - table of finite differences of previously calculated finite
%             differences
% f - function to interpolate
% h - |xi - xj| for every i,j in length(x)
%
% Output:
% t - finite differences table of nodes.

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

rowsPrevTable = size(prevTable, 1);  % dimensions of previous table
colsPrevTable = size(prevTable, 2);
if rowsPrevTable < 1  % empty table -> build new one
    n = length(x);  % nodes count
    t = zeros(n, n);  % zero all values
    %% Complete first column of new values (D0)
    for row = 1 : n
        t(row, 1) = y(row);
    end
    
    %% Complete table (Di)
    for col = 2 : n
        for row = 1 : n - col + 1
            %% Calculating col-th difference of x(row) in binomial way
            value = 0;  % resulting value
            k = col - 1;  % upper limit of summation
            for i = 0 : k
                value = value + (-1) ^ (i) * nchoosek(k, i) * t(row + k - i);
            end
            
            t(row, col) = value;
        end
    end
else  % table contains already some values -> compute others
    n = rowsPrevTable + length(x);  % new nodes count
    t = zeros(n, n);
    %% Copy old table in new one
    for row = 1 : rowsPrevTable
        for col = 1 : colsPrevTable
            t(row, col) = prevTable(row, col);
        end
    end
    
    %% Complete first column of new values (D0)
    for row = rowsPrevTable + 1: n
        t(row, 1) = y(row - rowsPrevTable);
    end
    
    %% Complete table (Di)
    for col = 2 : n
        row = n - col + 1;
        %% Calculating col-th difference of x(row) in binomial way
        value = 0;  % resulting value
        k = col - 1;  % upper limit of summation
        for i = 0 : k
            value = value + (-1) ^ (i) * nchoosek(k, i) * t(row + k - i);
        end

        t(row, col) = value;  % new diagonal
    end
end