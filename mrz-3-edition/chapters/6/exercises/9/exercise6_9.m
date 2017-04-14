function exercise6_9 ()
% EXERCISE6_9 Solves exercise 6.9 of book.
%
% exercise6_9 ()
%
% Given x, y values finds the regression line (using Cramer method) and
% plots values.

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
x = linspace(0, 1, 9);
y = [1 1.0078 1.0308 1.068 1.118 1.1792 1.25 1.3288 1.4142];
w = ones(1, length(x));
n = 1;  % regression line

%% Compute least-square method
a = leastSquareCramerInterpolate(x, y, w, n);  % find polynomial with Cramer's rule
disp('Squared error for regression line');
squaredError = leastSquareError(a, x, y, w)  % compute errorplot

%% Plot
plot(x, y, '-*');  % plot tabulation
hold on  % wait before showing plot
plot(x, a(2) * x + a(1), '-^');  % plot interpolation polynomial
hold on  % wait before showing plot
xlabel('x');  % add axis labels to plot
ylabel('interpolation values');
title('Regression line');  % add title
legend('Values', 'Fit');  % add legend
hold off;  % plot