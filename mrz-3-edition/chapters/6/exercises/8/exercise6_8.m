function exercise3_8 ()
% EXERCISE3_8 Solves exercse 3.8 of book.
%
% exercise3_8 ()
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
f = @(x) x^2/(x - 0.6) - 2.4;
fDerivative = @(x) (2*x)/(x - 3/5) - x^2/(x - 3/5)^2;  % derivative of f(x)
f2Derivative = @(x) 2/(x - 3/5) - (4*x)/(x - 3/5)^2 + (2*x^2)/(x - 3/5)^3;  % f''(x)
correctSolution = 1.2;
tolerance = 10 ^ (-8);
maxIterations = 40;
startPoint = 2;

%% Newton method
numberOfIterations = 0;
derivativeZero = false;
xN3 = 0;  % x_{n-3}, i.e the previous of the previous of the previous solution
xN2 = 0;  % x_{n-2}, i.e the previous of the previous solution
xN1 = 0;  % x_{n-1}, i.e the previous solution we computed, the second starting point
xN = startPoint;  % x_n, i.e the current value of solution, the starting point
p = -1;  % convergence order
x = startPoint;
simpleNewtonIterations = [x];  % list of iterations
deltaDiff = tolerance * 2;  % initialize diff
while deltaDiff >= tolerance && numberOfIterations < maxIterations && ~derivativeZero
    derivativeValue = feval(fDerivative, x);
    if derivativeValue ~= 0
        deltaDiff = - feval(f, x) / derivativeValue;
        x = x + deltaDiff;
        deltaDiff = abs(deltaDiff);
        simpleNewtonIterations = [ simpleNewtonIterations x];
    end
    
    %% Update previous values and calculate convergence order
    xN3 = xN2;
    xN2 = xN1;
    xN1 = xN;
    xN = x;
    p = log(abs(xN - xN1) / abs(xN1 - xN2)) / log(abs(xN1 - xN2) / abs(xN2 - xN3));
    
    numberOfIterations = numberOfIterations + 1;  % increase counter
    [numberOfIterations x feval(f, x) p]  % display current values
end

%% Method summary
disp('Newton method done!')
disp('Solution')
disp(x)
disp('f(solution)')
disp(feval(f, x))

%% Multiple-roots Newton method
numberOfIterations = 0;
derivativeZero = false;
xN3 = 0;  % x_{n-3}, i.e the previous of the previous of the previous solution
xN2 = 0;  % x_{n-2}, i.e the previous of the previous solution
xN1 = 0;  % x_{n-1}, i.e the previous solution we computed, the second starting point
xN = startPoint;  % x_n, i.e the current value of solution, the starting point
p = -1;  % convergence order
r = 2;  % multiplicity
x = startPoint;
mulNewtonIterations = [x];  % list of iterations
deltaDiff = tolerance * 2;  % initialize diff
while deltaDiff >= tolerance && numberOfIterations < maxIterations && ~derivativeZero
    derivativeValue = feval(fDerivative, x);
    if derivativeValue ~= 0
        deltaDiff = - r * feval(f, x) / feval(fDerivative, x);
        x = x + deltaDiff;
        deltaDiff = abs(deltaDiff);
        mulNewtonIterations = [ mulNewtonIterations x];
    end
    
    %% Update previous values and calculate convergence order
    xN3 = xN2;
    xN2 = xN1;
    xN1 = xN;
    xN = x;
    p = log(abs(xN - xN1) / abs(xN1 - xN2)) / log(abs(xN1 - xN2) / abs(xN2 - xN3));
    
    numberOfIterations = numberOfIterations + 1;  % increase counter
    [numberOfIterations x feval(f, x) p]  % display current values
end

%% Method summary
disp('Multiple-roots Newton method done!')
disp('Solution')
disp(x)
disp('f(solution)')
disp(feval(f, x))

%% Halley method
numberOfIterations = 0;
derivativeZero = false;
xN3 = 0;  % x_{n-3}, i.e the previous of the previous of the previous solution
xN2 = 0;  % x_{n-2}, i.e the previous of the previous solution
xN1 = 0;  % x_{n-1}, i.e the previous solution we computed, the second starting point
xN = startPoint;  % x_n, i.e the current value of solution, the starting point
p = -1;  % convergence order
x = startPoint;
halleyIterations = [x];  % list of iterations
deltaDiff = tolerance * 2;  % initialize diff
while deltaDiff >= tolerance && numberOfIterations < maxIterations && ~derivativeZero
    fx = feval(f, x);  % evaluate f(x), f'(x), f''(x)
    fDx = feval(fDerivative, x);
    fDDx = feval(f2Derivative, x);
    
    deltaDiff = - 2 * (fx * fDx) / (2 * (fDx ^ 2) - fx * fDDx);
    x = x + deltaDiff;
    deltaDiff = abs(deltaDiff);
    
    %% Update previous values and calculate convergence order
    xN3 = xN2;
    xN2 = xN1;
    xN1 = xN;
    xN = x;
    p = log(abs(xN - xN1) / abs(xN1 - xN2)) / log(abs(xN1 - xN2) / abs(xN2 - xN3));
    
    halleyIterations = [halleyIterations x];
    numberOfIterations = numberOfIterations + 1;  % increase counter
    [numberOfIterations x feval(f, x) p]  % display current values
end

%% Method summary
disp('Halley method done!')
disp('Solution')
disp(x)
disp('f(solution)')
disp(feval(f, x))

%% Plot results
figure  % initalize plot

%% Iterations
plot(linspacearray(simpleNewtonIterations), simpleNewtonIterations, '-');  % plot iterations
hold on  % wait before showing plot
plot(linspacearray(mulNewtonIterations), mulNewtonIterations, '--');  % plot iterations
hold on  % wait before showing plot
plot(linspacearray(halleyIterations), halleyIterations, 'x');  % plot iterations
hold on  % wait before showing plot

xlabel('iterations');  % add axis labels to plot
ylabel('solution approximation and number of correct digits');
title('Newton method VS Multiple-roots Newton VS Halley to solve f(x) = x^2/(x - 0.6) - 2.4 = 0');  % add title
legend('Newton method', 'Multiple-roots Newton method', 'Halley method');  % add legend
hold off  % release lock and show plot