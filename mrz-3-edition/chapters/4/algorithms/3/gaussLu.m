function [L, U, y] = gaussLu(A, b)
% GAUSSLU: Solves Ax = b where A is a nonsingular matrix with Gauss
% method.
%
%  [L, U, y] = gaussLu(Ab)
%
% Input:
% A - matrix n x n
% b - vector known terms
%
% Output:
% L - L matrix of LU-factorization (low triangular)
% U - U matrix of LU-factorization (upper triangular)
% y - vector to solve equation Ux = y to find x such that Ax = b

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


Ab = A;
n = size(A, 1);  % number of columns of A
Ab(:, n + 1) = b;  % add known terms vector
L = ones(n, n);
U = Ab;  % copy matrix

%% Initialize L
for i = 1 : n
    for j = i + 1 : n
        L(i, j) = 0;  % all zeros but the diagonal
    end
end

%% Initialize U with Gauss algorithm
for k = 1 : n -1
    for i = k + 1 : n
        L(i, k) = U(i, k) / U(k, k);
        for j = k : n + 1
            U(i, j) = U(i, j) - L(i, k) * U(k, j);
        end
    end
end

y = U(:, n + 1);
U(:, n + 1) = [];