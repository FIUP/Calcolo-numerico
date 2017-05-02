function [L, Uy] = gaussPivotingSolver(Ab)
% GAUSSPIVOTINGSOLVER: Solves Ax = b where A is a nonsingular matrix with
% Gauss pivoting method.
%
%  [L, Uy] = gaussLuSolver(Ab)
%
% Input:
% Ab - Matrix n x (n + 1), last column is b
%
% Output:
% L - L matrix of LU-factorization (low triangular)
% Uy - Matrix n x (n + 1), last column is b (upper triangular)

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


n = size(Ab, 1);  % number of rows of A
L = ones(n, n);
U = Ab;  % copy matrix

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
        L(j, i) = 0;
        U(j, i) = 0;
    end
end