function [yVal] = lagrangeApproximate(x, y, xVal)
% LAGRAMGEAPPROXIMATE given vectors x, y finds approximation of yVal using
% Lagrange method.
%
%  [yApproximation] = lagrangeApproximate(x, y, xVal)
%
% Input:
% x - vector of x point where function is known
% y - f(x)
% xVal - x - vector of x point where function is to approximate
%
% Output:
% yVal - approximation of f(xVal)

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

n = length(x);  % 1 + degree of resulting polynomial
m = length(xVal);  % points to evaluate - 1
yVal = [];  % resulting y values
for k = 1 : m
    characteristicPolynomials = [];  % list of all characteristic polynomial
    
    %% compute characteristic polynomial
    for i = 1 : n
        li = 1;  % evaluate prods for all j != i
        for j = 1 : i - 1
            li = li * (xVal(k) - x(j)) / (x(i) - x(j));
        end
        % skip j = i
        for j = i + 1 : n
            li = li * (xVal(k) - x(j)) / (x(i) - x(j));
        end
        
        characteristicPolynomials = [characteristicPolynomials li];
    end
    
    %% compute k-th yVal approx
    yk = 0;
    for i = 1 : n
        yk = yk + y(i) * characteristicPolynomials(i);
    end
    
    yVal = [yVal yk];
end