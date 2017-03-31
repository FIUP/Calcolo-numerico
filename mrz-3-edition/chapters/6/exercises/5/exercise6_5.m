function bisectionVSAnomymous (startPoint)
% BISECTIONVSANONYMOUS Plots iterations of the bisection method VS a given
% fixed point method.
%
% bisectionVSAnomymous (startPoint)
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
f = @(x) x.^4-8 * x.^ 3 + 24 * x.^2 - 33 * x + 18;
correctSolution = 2;
tolerance = 10 ^ (-8);
maxIterations = 100;

%% Bisection method
numberOfIterations = 0;
lX = 1;
rX = 2.7;
bisectionIterations = [];  % list that will contain iteration values
deltaDiff = tolerance * 2;  % initialize diff
while deltaDiff >= tolerance && numberOfIterations < maxIterations
    rExt = feval(f, rX);  % compute 
    lExt = feval(f, lX);
    x = lX + (rX - lX) * 0.5;
    fX = feval(f, x);
    
    if lExt * rExt < 0
        rX = x;
    elseif lExt * rExt > 0
        lX = x;
    else
        deltaDiff = 0;
    end
    
    bisectionIterations = [bisectionIterations x];
    numberOfIterations  = numberOfIterations + 1;  % increase counter
end

if deltaDiff ~= 0
    x = lX + deltaDiff * 0.25;
    bisectionIterations = [bisectionIterations x];
end
correctBisectionDigits = numberOfCorrectDigits(bisectionIterations, correctSolution);  % compute number of correct digit per iteration

%% Anonymous fixed-point method
ptFixedNext = @(x) 2 + (x - 2) ^ 4;  % method to calculate next iteration
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
plot(linspacearray(bisectionIterations), bisectionIterations, '-');  % plot iterations
hold on  % wait before showing plot
plot(linspacearray(iterations), iterations, '--');  % plot iterations
hold on  % wait before showing plot

%% Digits
plot(linspacearray(correctBisectionDigits), correctBisectionDigits, 'x');  % plot digits
hold on  % wait before showing plot
plot(linspacearray(correctDigits), correctDigits, '*');  % plot digits
hold on  % wait before showing plot

xlabel('iterations');  % add axis labels to plot
ylabel('solution approximation and number of correct digits');
title('Bisection method VS (2 + (x - 2)^4 to solve f(x) =  x^4-8 * x^ 3 + 24 * x^2 - 33 * x + 18 = 0');  % add title
legend('Bisection method', 'other method', 'number of correct digits with bisection method', 'number of correct digits with other method');  % add legend
hold off  % release lock and show plot