function steffensenPlotter (startPoint)
% STEFFENSENPLOTTER Plots iterations of Steffensen methods for a given
% equation.
%
% steffensenPlotter (startPoint)
%
% Input:
% startPoint - starting point of method

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

%% Input settings
f = @(x) 4 / x;
correctSolution = 2;
tolerance = 10 ^ (-8);
maxIterations = 100;

%% Steffensen method
numberOfIterations = 0;
x = startPoint;
iterations = [x];  % list that will contain iteration values
deltaDiff = tolerance * 2;  % initialize diff
while deltaDiff >= tolerance && numberOfIterations < maxIterations
    u0 = x;  % build aitken list
    u1 = feval(f, u0);
    u2 = feval(f, u1);
    xNew = aitken([u0 u1 u2]);
    deltaDiff = abs(x - xNew);
    x = xNew;
    iterations = [iterations x];
    numberOfIterations  = numberOfIterations + 1;  % increase counter
end

correctDigits = numberOfCorrectDigits(iterations, correctSolution);  % compute number of correct digit per iteration

%% Plot results
figure  % initalize plot
plot(linspacearray(iterations), iterations, '-');  % plot iterations
hold on  % wait before showing plot

plot(linspacearray(correctDigits), correctDigits, '--');  % plot digits
hold on  % wait before showing plot

xlabel('iterations');  % add axis labels to plot
ylabel('solution approximation and number of correct digits');
title('Steffensen method to solve f(x) = 4 / x = x');  % add title
legend('Steffensen method', 'number of correct digits');  % add legend
hold off  % release lock and show plot