function exercise3_6 ()
% EXERCISE3_6 Solves exercse 3.6 of book.
%
% exercise3_6 ()
%
% Use Newton method to solve f(x) = 0. Then use a different pt-fixed method
% and plot the comparison.

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
f = @(x) x.* (x.^ 2 - 2);  % solutions are 0, -sqrt(2), +sqrt(2)
fDerivative = @(x) 3 * x.^ 2 - 2;
correctSolution = sqrt(2);
tolerance = 10 ^ (-8);
maxIterations = 100;
startPoint = 10;

%% Newton method
numberOfIterations = 0;
derivativeZero = false;
x = startPoint;
simpleNewtonIterations = [x];  % list of iterations
deltaDiff = tolerance * 2;  % initialize diff
while deltaDiff >= tolerance && numberOfIterations < maxIterations && ~derivativeZero
    derivativeValue = feval(fDerivative, x);
    if derivativeValue == 0
        derivativeZero = true;
    else
        deltaDiff = - feval(f, x) / derivativeValue;
        x = x + deltaDiff;
        deltaDiff = abs(deltaDiff);
        simpleNewtonIterations = [ simpleNewtonIterations x];
    end
    numberOfIterations = numberOfIterations + 1;  % increase counter
end
simpleNewtonDigits = numberOfCorrectDigits(simpleNewtonIterations, correctSolution);

%% Anonymous fixed-point method
ptFixedNext = @(x) x.* (x.^ 2 + 6) / (3 * x.^ 2 + 2);  % method to calculate next iteration
numberOfIterations = 0;
x = startPoint;
iterations = [x];  % list that will contain iteration values
deltaDiff = tolerance * 2;  % initialize diff
while deltaDiff >= tolerance && numberOfIterations < maxIterations
    xNew = feval(ptFixedNext, x);
    deltaDiff = abs(x - xNew);
    x = xNew;
    iterations = [iterations x];
    numberOfIterations  = numberOfIterations + 1;  % increase counter
end
correctDigits = numberOfCorrectDigits(iterations, correctSolution);  % compute number of correct digit per iteration

%% Plot results
figure  % initalize plot

%% Iterations
plot(linspacearray(simpleNewtonIterations) - 1, simpleNewtonIterations, '-');  % plot iterations
hold on  % wait before showing plot
plot(linspacearray(iterations) - 1, iterations, '--');  % plot iterations
hold on  % wait before showing plot

%% Digits
plot(linspacearray(simpleNewtonDigits) - 1, simpleNewtonDigits, 'x');  % plot digits
hold on  % wait before showing plot
plot(linspacearray(correctDigits) - 1, correctDigits, '*');  % plot digits
hold on  % wait before showing plot

xlabel('iterations');  % add axis labels to plot
ylabel('solution approximation and number of correct digits');
title('Newton method VS x* (x ^ 2 + 6) / (3 * x ^ 2 + 2) to solve f(x) = x * (x ^ 2 - 2) = 0');  % add title
legend('Newton method', 'other method', 'number of correct digits with newton method', 'number of correct digits with other method');  % add legend
hold off  % release lock and show plot