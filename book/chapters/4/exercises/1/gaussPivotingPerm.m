function [P, L, U, y] = gaussPivotingPerm(A, b)
% GAUSSPIVOTINGWITHPERM: Solves Ax = b where A is a
% nonsingular matrix with Gauss pivoting method.
%
%  [P, L, U, y] = gaussPivotingPerm(Ab)
%
% Input:
% A - matrix n x n
% b - vector known terms
%
% Output:
% P - Permutation matrix such that PA = LU
% L - L matrix of LU-factorization (low triangular)
% U - U matrix of LU-factorization (upper triangular)
% y - vector to solve equation Ux = y, x such that Ax = b

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

%% Initialize permutation vector
vp = zeros(1, n);
for i = 1 : n
    vp(i) = i;
end
vp = vp';  % array -> vector

%% Gauss algorithm with pivoting
for k = 1 : n - 1
    r = k;  % r such that |U(r, k)| is max of |U(i, k)| for k <= i <= n
    maxV = abs(U(r, k));
    for i = k : n
        if abs(U(i, k)) > maxV
            maxV = abs(U(i, k));
            r = i;
        end
    end
    
    if r ~= k
        tmpRow = U(r, :);  % swap r-th row and k-th row of U
        U(r, :) = U(k, :);
        U(k, :) = tmpRow;
        
        tmpValPermVector = vp(r);  % update permutation vector too
        vp(r) = vp(k);
        vp(k) = tmpValPermVector;
    end
    
    for i = k + 1 : n
        U(i, k) = U(i, k) / U(k, k);
        for j = k + 1 : n + 1
            U(i, j) = U(i, j) - U(i, k) * U(k, j);
        end
    end
end

%% Build L and zero U
for i = 1 : n
    for j = i + 1 : n
        L(i, j) = 0;
        L(j, i) = A(j, i);
        U(j, i) = 0;
    end
end

%% Refactor y, U
y = U(:, n + 1);
U(:, n + 1) = [];

%% Build permutation matrix
P = eye(n);  % identity matrix
for i = 1 : n  % loop through rows
    rowToSwap = vp(i);
    if i ~= rowToSwap  % avoid swapping exact same rows for better performance
        tmpRow = P(i, :);  % swap rows
        P(i, :) = P(rowToSwap, :);
        P(rowToSwap, :) = tmpRow;
    end
end