function [c] = chebyshevPolynomia(n)
% CHEBYSHEVPOLYNOMIAL: Finds the coefficients of the n-degree Chebyshev
% polynomial.
%
% [c] = chebyshevPolynomia(n)
% 
% Input:
% n - degree of the polynomial
% 
% Output:
% c - vector with the coefficients. The coefficients are given in reversed
% form, that is c = [3 1 4] means the polynomial is 3x² + x + 4.

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

if n == 0  % side case
    c = [1];
elseif n == 1  % line
    c = [1 0];
else
    %% Initialize dp problem
    tk2 = zeros(1, n + 1);  % contains the T_{k - 2}(x) coefficients
    tk1 = zeros(1, n + 1);  % contains the T_{k - 1}(x) coefficients
    c = zeros(1, n + 1);  % contains the T_{k}(x) coefficients
    tk2(3) = 1;
    tk1(1) = 1;
    
    %% Use T_{k-2}(x) and T_{k-1}(x) to dp-solve c
    for k = 3 : n + 1
        for i = 1 : k
            c(i) = 2 * tk1(i) - tk2(i);  % Chebyshev polynomia 3-item relationship
        end
        
        for i = 1 : k - 1
            tk2(i + 2) = tk1(i);  % update values
            tk1(i) = c(i);
        end
        
        tk1(k) = c(k);
    end
end