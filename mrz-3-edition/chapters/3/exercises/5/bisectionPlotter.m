function bisectionPlotter (a, b, minC, maxC)
% PARABOLASOLVERTESTER Solves parabola equation in a smart way and in a
% dumb way, then it plots the findings.
%
% parabolaSolverTester (a, b, minC, maxC)
%
% Given a parabola equation like ax² + bx + c = 0
%
% Input:
% a - coefficient of x²
% b - coefficient of x
% minC - min value of known term
% maxC - max value of known term

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

cValues = 100;  % number of c values to test
stepC = abs(minC - maxC) / cValues;  % step at which solve new parabola
x2s = [];  % list that will contain smart solutions
x2Dumbs = [];
for c = minC : stepC : maxC - stepC  % not include max
    [x1Smart, x2Smart] = parabolaSolverSmartVersion(a, b, c);
    [x1Dumb, x2Dumb] = parabolaSolver(a, b, c);
    
    x2s = [x2s x2Smart];  % append new solutions
    x2Dumbs = [x2Dumbs x2Dumb];
end

cValues = linspace(minC, maxC, cValues);
figure  % initialize plot
plot(cValues, x2Dumbs, cValues, x2s);  % plot values
    
title('dumb and clever way to solve parabolas');  % add title
xlabel('c value');  % add axis labels to plot
ylabel('x2 value');
legend('dumb', 'smart');  % add legend