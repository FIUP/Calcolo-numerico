function exercise6_8 ()
% EXERCISE6_8 Computes Least-Square method to find interpolator polynomial.
%
% exercise6_8 ()

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

%% Example 6.6 input
x = [-5 -3 1 3 4 6 8];
y = [18 7 0 7 16 50 67];
w = ones(1, length(x));  % weights all 1
n = 1;  % regression line
a = leastSquareInterpolate(x, y, w, n);  % find polynomial
disp('Squared error for regression line of example 6.6');
squaredError = leastSquareError(a, x, y, w)  % compute error

%% Plot
plot(x, y, '-*');  % plot tabulation
hold on  % wait before showing plot
plot(x, a(2) * x + a(1), '-^');  % plot interpolation polynomial
hold on  % wait before showing plot

%% Example 6.6 with abnormal weight
w(5) = 20;  % x(5) more important
n = 1;  % regression line
a = leastSquareInterpolate(x, y, w, n);  % find polynomial
disp('Squared error for regression line of example 6.6 with abnormal weight')
squaredErr = leastSquareError(a, x, y, w)  % compute error

%% Plot
plot(x, a(2) * x + a(1), '-^');  % plot interpolation polynomial
hold on  % wait before showing plot

%% Example 6.6 with parabola
w = ones(1, length(x));  % weights all 1
n = 2;  % parabola
a = leastSquareInterpolate(x, y, w, n);  % find polynomial
disp('Squared error for regression line of example 6.6 with parabola')
squaredErr = leastSquareError(a, x, y, w)  % compute error

%% Plot
plot(x, a(3) * x .^ 2 + a(2) * x + a(1), '-.');  % plot interpolation polynomial
hold on  % wait before showing plot

%% Example 6.7
x = [-1 2 5 6];
y = [-3 5 12 21];
w = ones(1, length(x));  % weights all 1
n = 1;  % regression line
a = leastSquareInterpolate(x, y, w, n);  % find polynomial
disp('Squared error for regression line of example 6.7')
squaredErr = leastSquareError(a, x, y, w)  % compute error

%% Plot
plot(x, y, '-x');  % plot tabulation
hold on  % wait before showing plot
plot(x, a(2) * x + a(1), '-+');  % plot interpolation polynomial
hold on  % wait before showing plot

xlabel('x');  % add axis labels to plot
ylabel('interpolation values');
title('Interpolating polynomials of examples 6.6');  % add title
legend('Example 6.6 values', 'Linear regression', 'Linear regression with x_4 abnormal weight', 'Parabola interpolation', 'Example 6.7 values', 'Linear regression');  % add legend
hold off;  % plot