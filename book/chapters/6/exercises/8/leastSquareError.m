function [e] = leastSquareError(a, x, y, w)
% LEASTSQUAREERROR Computes least square error of given interpolator
% polynomial.
%
%  [e] = leastSquareError(a, x, y, w)
%
% Input:
% a - coefficients of polynomial to examine
% x - vector of x point where function is known
% y - f(x)
% w - weights of points
%
% Output:
% e - error of polynomial with given x, y values

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

m = length(x);  % count points
n = length(a) - 1;  % degree of polynomial
e = 0.0;
for i = 1 : m
    correctValue = y(i);
    approximateValue = 0.0;  % evaluate polynomial in point
    for k = 1 : n + 1
        approximateValue = approximateValue + a(k) * x(i) ^ (k - 1);
    end
    
    squaredError = (correctValue - approximateValue) ^ 2;
    e = e + squaredError * w(i);  % add weight
end