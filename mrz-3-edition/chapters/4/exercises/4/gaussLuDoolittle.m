function [L, U] = gaussLuDoolittle(A)
% GAUSSLUDOOLITTLE: Gauss-Doolitle LU factorization of Ab so that L is
% lower triangular, U is upper.
%
%  [L, U] = gaussLuDoolittle(A, b)
%
% Input:
% A - matrix n x n
%
% Output:
% L - L matrix of LU-factorization (low triangular)
% U - U matrix of LU-factorization (upper triangular)

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

n = size(A, 1);  % number of columns of A
L = zeros(n, n);
U = zeros(n, n);

%% Compute U, L
syms k;
for j = 1 : n
    for i = j : n
        s = 0;  % compute s
        for k = 1 : j - 1
            s = s + L(j, k) * U(k, i);
        end
        
        U(j, i) = A(j, i) - s;
    end
    
    L(j, j) = 1;
    
    for i = j + 1 : n
        s = 0;  % compute s
        for k = 1 : j - 1
            s = s + L(i, k) * U(k, j);
        end
        
        L(i, j) = (A(i, j) - s) / (U(j, j));
    end
end
