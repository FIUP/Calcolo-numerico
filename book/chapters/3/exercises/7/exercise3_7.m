function exercise3_7 ()
% EXERCISE3_7 Solves exercse 3.7 of book.
%
% exercise3_7 ()
%
% Use bisection method to solve f(x) = 0. Then use a different pt-fixed method
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
f = @(x) exp(-3 * x) - x + 1;
correctSolution = 1.043673240055106430058022568879629475614392531240681;
tolerance = 10 ^ (-8);
maxIterations = 40;
startPoint = 1.5;

%% Bisection method
numberOfIterations = 0;
lX = 1;
rX = 1.5;
xN3 = 0;  % x_{n-3}, i.e the previous of the previous of the previous solution
xN2 = 0;  % x_{n-2}, i.e the previous of the previous solution
xN1 = 0;  % x_{n-1}, i.e the previous solution we computed, the second starting point
xN = startPoint;  % x_n, i.e the current value of solution, the starting point
p = -1;  % convergence order
bisectionIterations = [];  % list that will contain iteration values
deltaDiff = tolerance * 2;  % initialize diff
while deltaDiff >= tolerance && numberOfIterations < maxIterations
    rExt = feval(f, rX);
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
    
    %% Update previous values and calculate convergence order
    xN3 = xN2;
    xN2 = xN1;
    xN1 = xN;
    xN = x;
    p = log(abs(xN - xN1) / abs(xN1 - xN2)) / log(abs(xN1 - xN2) / abs(xN2 - xN3));
    
    bisectionIterations = [bisectionIterations x];  
    numberOfIterations  = numberOfIterations + 1;  % increase counter
    [numberOfIterations x p]  % display current values
end

%% Method summary
disp('Bisection method done!')
disp('Solution')
disp(x)
disp('f(solution)')
disp(feval(f, x))

%% Anonymous fixed-point method
ptFixedNext = @(x) (exp(-3 * x) * (3 * x + 1) + 1) / (3 * exp(-3 * x) + 1);  % method to calculate next iteration
numberOfIterations = 0;
x = startPoint;
xN3 = 0;  % x_{n-3}, i.e the previous of the previous of the previous solution
xN2 = 0;  % x_{n-2}, i.e the previous of the previous solution
xN1 = 0;  % x_{n-1}, i.e the previous solution we computed, the second starting point
xN = startPoint;  % x_n, i.e the current value of solution, the starting point
p = -1;  % convergence order
iterations = [x];  % list that will contain iteration values
deltaDiff = tolerance * 2;  % initialize diff
while deltaDiff >= tolerance && numberOfIterations < maxIterations
    xNew = feval(ptFixedNext, x);
    deltaDiff = abs(x - xNew);
    x = xNew;
    
    %% Update previous values and calculate convergence order
    xN3 = xN2;
    xN2 = xN1;
    xN1 = xN;
    xN = x;
    p = log(abs(xN - xN1) / abs(xN1 - xN2)) / log(abs(xN1 - xN2) / abs(xN2 - xN3));
    
    iterations = [iterations x];
    numberOfIterations  = numberOfIterations + 1;  % increase counter
    [numberOfIterations x p]  % display current values
end

%% Method summary
disp('Fixed-point method done!')
disp('Solution')
disp(x)
disp('f(solution)')
disp(feval(f, x))

%% Plot results
figure  % initalize plot

%% Iterations
plot(linspacearray(bisectionIterations), bisectionIterations, '-');  % plot iterations
hold on  % wait before showing plot
plot(linspacearray(iterations) - 1, iterations, '--');  % plot iterations
hold on  % wait before showing plot

xlabel('iterations');  % add axis labels to plot
ylabel('solution approximation and number of correct digits');
title('Bisection method VS (exp(-3 * x) * (3 * x + 1) + 1) / (3 * exp(-3 * x) + 1) to solve f(x) = exp(-3 * x) - x + 1 = 0');  % add title
legend('Bisection method', 'other method');  % add legend
hold off  % release lock and show plot