function exercise6_7 ()
% EXERCISE6_7 Solves exercse 6.7 of book.
%
% exercise6_7 ()
%
% Compare usual interpolation with Chebyshev roots interpolation.

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

%% Input
f = @(x) exp(x) + sqrt(abs(x));  % function
intervalStart = -1;  % interval
intervalEnd = 1;
trainPointsCount = 11;  % how much points to sample
xTrain = linspace(intervalStart, intervalEnd, trainPointsCount);  % sample points
yTrain = f(xTrain);
testPointsCount = 101;
xTest = linspace(intervalStart, intervalEnd, testPointsCount);  % points to approximate

%% Naive interpolation
yTestNaive = newtonApproximate(xTrain, yTrain, xTest);  % approximate

%% Naive interpolation
chebyshevPolDegree = 10;
chebyshevPolynomialNodes = chebyshevPolynomiaZeros(chebyshevPolDegree);  % nodes to train
yTrain = f(chebyshevPolynomialNodes);  % evaluate function in chebyshev nodes
yTestChebyshev = newtonApproximate(chebyshevPolynomialNodes, yTrain, xTest);  % approximate

%% Plot results
figure  % initalize plot

%% Iterations
plot(xTest, yTestNaive, '-x');  % plot naive method
hold on  % wait before showing plot
plot(xTest, yTestChebyshev, '-o');  % plot interpolation with Chebyshev nodes
hold on  % wait before showing plot
plot(xTest, f(xTest), '--');
hold on

xlabel('x');  % add axis labels to plot
ylabel('interpolation polynomia values');
title('Naive method VS Chebyshev nodes to interpolate f(x) = exp(x) - sqrt(|x|)');  % add title
legend('Naive train nodes', 'Chebyshev nodes', 'f(x)');  % add legend
hold off  % release lock and show plot