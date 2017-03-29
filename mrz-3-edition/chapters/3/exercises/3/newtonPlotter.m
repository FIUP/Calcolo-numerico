function newtonPlotter (startPoint)
% NEWTONPLOTTER Plots convergence of various Newton methods for a sample
% equation f(x) = (x - 1)^2 = 0
% 
% Input:
% startPoint - initial point where to start Newton methods

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
f = @(x) (x - 1)^2;  % the sample function
fDerivative = @(x) 2 * x - 2;  % derivative of f
tolerance = 10 ^ (-8);
maxIterations = 100;

%% Newton method
numberOfIterations = 0;
derivativeZero = false;
x = startPoint;
simpleNetwonIterations = [x];  % list of iterations
deltaDiff = tolerance * 2;  % initialize diff
while deltaDiff >= tolerance && numberOfIterations < maxIterations && ~derivativeZero
    derivativeValue = feval(fDerivative, x);
    if derivativeValue == 0
        derivativeZero = true;
    else
        deltaDiff = - feval(f, x) / derivativeValue;
        x = x + deltaDiff;
        deltaDiff = abs(deltaDiff);
        simpleNetwonIterations = [ simpleNetwonIterations x];
    end
    numberOfIterations = numberOfIterations + 1;  % increase counter
end

%% Newton method with multiplicity
r = 2;  % multiplicity
numberOfIterations = 0;
x = startPoint;
mulNetwonIterations = [x];  % list of iterations
deltaDiff = tolerance * 2;  % initialize diff
while deltaDiff >= tolerance && numberOfIterations < maxIterations
    derivativeValue = feval(fDerivative, x);
    if derivativeValue ~= 0
        deltaDiff = - r * feval(f, x) / feval(fDerivative, x);
        x = x + deltaDiff;
        deltaDiff = abs(deltaDiff);
        mulNetwonIterations = [ mulNetwonIterations x];
    end
    numberOfIterations  = numberOfIterations + 1;  % increase counter
end

%% Solution checking
correctSolution = 1;
simpleNetwonDigits = numberOfCorrectDigits(simpleNetwonIterations, correctSolution);
mulNetwonDigits = numberOfCorrectDigits(mulNetwonIterations, correctSolution);

%% Plot results
figure  % initalize plot

%% Iterations
plot(linspacearray(simpleNetwonIterations), simpleNetwonIterations, '-');  % plot simple Newton method iterations
hold on  % wait before showing plot

plot(linspacearray(mulNetwonIterations), mulNetwonIterations, '--');  % plot multiple roots Newton method
hold on  % wait before showing plot

%% Digits
plot(linspacearray(simpleNetwonDigits), simpleNetwonDigits, 'x');  % plot simple Newton method iterations
hold on  % wait before showing plot

plot(linspacearray(mulNetwonDigits), mulNetwonDigits, '*');  % plot multiple roots Newton method
hold on  % wait before showing plot

xlabel('iterations');  % add axis labels to plot
ylabel('solution approximation and number of correct digits');
title('Comparison of Newton VS MultipleRootsNewton methods on f(x) = (x-1)^3');  % add title
legend('Newton method', 'MultipleRootsNewton', 'correct digit with Newton method', 'correct digit with MultipleRootsNewton');  % add legend
hold off  % release lock and show plot