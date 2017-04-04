function exercise6_5 ()
% EXERCISE6_5 Solves exercise 6.5 of book. Given f(x) in [2 .. 5],
% approximate the function with Newton interpolation.  
%
% exercise6_5 ()
%
% Output:
% void - plots chart with error values.

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

f = @(x) exp(2 * x) ./ x .^ 3;  % function
intervalStart = 2;  % interval
intervalEnd = 5;
trainPointsCount = 6;  % how much points to sample
xTrain = linspace(intervalStart, intervalEnd, trainPointsCount);  % sample points
yTrain = f(xTrain);
testPointsCount = 51;
xTest = linspace(intervalStart, intervalEnd, testPointsCount);  % points to approximate
yTest = newtonApproximate(xTrain, yTrain, xTest);  % approximate

%% Show results
%% Raw values
for p = 1 : testPointsCount
    xTest(p), yTest(p)
end

%% Absolute error values
absoluteErrors = absoluteError(yTest, f(xTest));  % see section 6.3.6
for p = 1 : testPointsCount
    xTest(p), absoluteErrors(p)
end

%% Plot approximations and errors
figure  % initalize plot

%% Iterations
plot(xTest, yTest, '-o');  % plot approximation
hold on  % wait before showing plot
plot(xTest, f(xTest), '-');  % plot correct values
hold on  % wait before showing plot
plot(xTest, absoluteErrors, '-x');  % plot errors
hold on  % wait before showing plot

xlabel('x');  % add axis labels to plot
ylabel('approximation, correct values and error');
title('Approximating f(x) = exp(2x) / x^3 with Newton method in [2, 5]');  % add title
legend('Approximation', 'f(x)', 'Errors');  % add legend
hold off  % release lock and show plot