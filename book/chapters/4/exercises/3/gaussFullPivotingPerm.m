function [P, Q, L, U, y] = gaussFullPivotingPerm(A, b)
% GAUSSFULLPIVOTINGWITHPERM: Solves Ax = b where A is a nonsingular matrix with
% Gauss complete pivoting method.
%
%  [P, Q, L, U, y] = gaussFullPivotingPerm(Ab)
%
% Input:
% A - matrix n x n
% b - vector known terms
%
% Output:
% P - Permutation matrix such that PA = LU
% Q - Permutation vector of columns to swap solution aftwerards
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

%% Initialize permutation vectors
vpRows = zeros(1, n);
for i = 1 : n
    vpRows(i) = i;
end
vpRows = vpRows';  % array -> vector

vpCols = zeros(1, n);
for i = 1 : n
    vpCols(i) = i;
end
vpCols = vpCols';  % array -> vector

%% Gauss algorithm with pivoting
for k = 1 : n - 1
    r = k;  % r, s such that |U(r, s)| is max of |U(i, j)| for k <= i, j <= n
    s = k;
    maxV = abs(U(r, s));
    for i = k : n
        for j = k : n
            if abs(U(i, j)) > maxV
                maxV = abs(U(i, j));
                r = i;
                s = j;
            end
        end
    end
    
    if r ~= k
        tmpRow = U(r, :);  % swap r-th row and k-th row of U
        U(r, :) = U(k, :);
        U(k, :) = tmpRow;
        
        tmpValPermVector = vpRows(r);  % update permutation vector too
        vpRows(r) = vpRows(k);
        vpRows(k) = tmpValPermVector;
    end
    
    if s ~= k
        tmpCol = U(:, s);  % swap s-th col and k-th col of U
        U(:, s) = U(:, k);
        U(:, k) = tmpCol;
        
        tmpValPermVector = vpCols(s);  % update permutation vector too
        vpCols(s) = vpCols(k);
        vpCols(k) = tmpValPermVector;
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
    rowToSwap = vpRows(i);
    if i ~= rowToSwap  % avoid swapping exact same rows for better performance
        tmpRow = P(i, :);  % swap rows
        P(i, :) = P(rowToSwap, :);
        P(rowToSwap, :) = tmpRow;
    end
end

Q = vpCols;