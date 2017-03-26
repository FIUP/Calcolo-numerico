function secantVSNewton (a, startPoint0, startPoint1, maxIterations)
% SECANTVSNEWTON Compares the secant method and the Newton one to solve an
% equation in the form f(x) = 0. In this particular case f(x) = a - 1/x,
% that is equivalent to compute x = 1/a.
%
% secantVSNewton ()
%
% Input:
% a - number to compute
% startPoint0 - starting point of method (needed for both methods)
% startPoint1 - second starting point of method (needed for secant method)
% maxIterations - max number of iterations to execute
%
% Output:
% void - show plot with the 2 methods iterations comparison

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

xSecant = startPoint0;  % x value for secant method
xOldSecant = startPoint1;  % x old value for secant method
xNewton = startPoint0;  % x value for newton method
solution = 1 / a;  % exact solution

secantIterationsErrors = [];  % relative errors of values of x for each iteration of the secant method
newtonIterationsErrors = [];  % relative errors of values of x for each iteration of the newton method
iterations = linspace(1, maxIterations, maxIterations + 1);  % vector [1 2 .. maxIterations]

for iteration = 0 : maxIterations  % execute iterations
    %% Newton method
    xNew = xNewton * (2 - a * xNewton);  % compute Newton iteration
    error = abs(a * xNew - 1);  % compute  error
    newtonIterationsErrors = [newtonIterationsErrors error];  % append new error
    xNewton = xNew;  % save new x value for next iteration
    
    %% Secant method
    fx = a - 1 / xSecant;  % compute secant iteration
    fxOld = a - 1 / xOldSecant;
    secantValue = (fx - fxOld) / (xSecant - xOldSecant);
    deltaDiff = - fx / secantValue;
    xNew = xSecant + deltaDiff;
    error = abs(a * xNew - 1);  % compute  error
    secantIterationsErrors = [secantIterationsErrors error];  % append new error
    xOldSecant = xSecant;  % save new x values for next iteration
    xSecant = xNew;
end

figure  % initalize plot
plot(iterations, newtonIterationsErrors);  % plot Newton errors
hold on  % wait before showing plot

plot(iterations, secantIterationsErrors);  % plot secant errors
hold on  % wait before showing plot

xlabel('iterations');  % add axis labels to plot
ylabel('relative error');
title('Comparison of Newton VS secant method to solve f(x) = a - 1/x = 0');  % add title
legend('Newton method', 'secant method');  % add legend
hold off  % release lock and show plot