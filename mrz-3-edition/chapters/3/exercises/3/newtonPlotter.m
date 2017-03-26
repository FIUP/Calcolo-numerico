function [errTable] = squaredMultiplicationsTester (minN, maxN)
% SQUAREDMULTIPLICATIONSTESTER Evaluates f(n) for all n in [minN, maxN]
% 
% Input:
% minN - the min arg of f(n)
% maxN - the max arg of f(n)
%
% Output:
% errTable - table of |maxN - minN| rows. Each row has 4 columns:
%            1) n
%            2) absolute error
%            3) relative error
%            4) number of correct significant figures

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

errTable = [];
for i = minN : maxN
    currentN = i;  % arg of f(n)
    realValue = 1;  % real value of f(n)
    computedValue = squaredMultiplications(currentN);  % computed value of f(n)
    absoluteError = abs(computedValue - realValue);  % errors
    relativeError = absoluteError / realValue;
    correctSignificantFigures = abs(round(log10(relativeError)));
    
    currentRow = [currentN absoluteError relativeError correctSignificantFigures];
    % currentRow = [currentN realValue computedValue absoluteError];
    errTable = cat(1, errTable, currentRow);  % append results to table
end