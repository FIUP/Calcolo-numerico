function [newtonCoeffs, divDiffCoeffs] = exercise6_4 (xTrain, yTrain)
% EXERCISE6_4 Solves exercise 6.4 of book. Compares 2 methods to find the
% coefficients of the interpolation polynomial.
%
% exercise6_4 (xTrain, yTrain)
%
% Input:
% xTrain - n + 1 nodes
% yTrain - f(xTrain)
%
% Output:
% newtonCoeffs - coefficients of interpolation using Newton method
% divDiffCoeffs - coefficients of interpolation using divided differences
%                 table

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

n = length(xTrain) - 1;  % degree of interpolation polynomail

%% Newton method
newtonCoeffs = zeros(1, n + 1);  % pre allocate for performance
newtonCoeffs(1) = yTrain(1);
for i = 2 : n + 1
    d = xTrain(i) - xTrain(i - 1);  % delta on x
    u = newtonCoeffs(i - 1);  % previous coeff
    for j = i - 2 : -1 : 1
        u = u * (xTrain(i) - xTrain(j)) + newtonCoeffs(j);
        d = d * (xTrain(i) - xTrain(j));
    end
    newtonCoeffs(i) = (yTrain(i) - u) / d;
end

%% Divided differences method
divDiffTable = dividedDifferencesTable(xTrain, yTrain);
divDiffCoeffs = divDiffTable(1, :);  % get first line