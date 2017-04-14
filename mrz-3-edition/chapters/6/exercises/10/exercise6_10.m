function exercise6_10 ()
% EXERCISE6_10 Solves exercise 6.10 of book.
%
% exercise6_10 ()
%
% Given x, y values finds the regression line and plots values.

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
x = [0 0.17 0.34 0.51 0.68 0.85 1.02 1.19 1.36 1.53 1.7 1.87];
y = [0.31 0.237 0.249 0.419 0.535 0.575 0.609 0.429 0.169 0.0 -0.017 -0.179];
w = [1 1 20 1 1 1 1 1 1 1 20 1];
n = 1;  % regression line

%% Compute least-square method
a = leastSquareInterpolate(x, y, w, n);  % find polynomial
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