function [coeffs] = leastSquareCramerInterpolate(x, y, w, n)
% LEASTSQUARECRAMERINTERPOLATE Interpolate points (with weights) and find the
% least-square polynomial fitting. Uses Cramer method to solve Ax = b.
%
%  [coeffs] = leastSquareCramerInterpolate(x, y, w, n)
%
% Creates linear system Ax = b (A'A x = A'b) to find polynomial and finds
% solution with Cramer's rule.
%
% Input:
% x - vector of x point where function is known
% y - f(x)
% w - weights of points
% n - degree of polynomial to find
%
% Output:
% coeffs - coefficients of the polynomial interpolator. coeffs_i is the x^i
%          coefficient of the polynomial

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

m = length(x);

%% Create matrix A and vector b
A = zeros(m, n + 1);  % len(x) rows and (n + 1) columns
b = zeros(m, 1);
for row = 1 : m
    for col = 1 : n + 1
        A(row, col) = sqrt(w(row)) * x(row) ^ (col - 1);
    end
    
    b(row) = sqrt(w(row)) * y(row);
end

%% Get solutions (x vector) with LU (Gauss) factorization
coeffs = cramerSolver(A' * A, A' * b);