function [X] = gaussInvert(A)
% GAUSSINVERT: Finds A^-1 with Gauss method
%
%  [X] = gaussInvert(A)
%
% Input:
% A - matrix n x n
%
% Output:
% X - matrix n x n such that MA = I (M is the inverse of A)

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
L = ones(n, n);
U = A;  % copy matrix

%% Initialize L
for i = 1 : n
    for j = i + 1 : n
        L(i, j) = 0;  % all zeros but the diagonal
    end
end

%% Compute L, U with Gauss algorithm
for k = 1 : n -1
    for i = k + 1 : n
        L(i, k) = U(i, k) / U(k, k);
        for j = k : n
            U(i, j) = U(i, j) - L(i, k) * U(k, j);
        end
    end
end

[M] = lowTriInv(L);  % find inverse of L
X = zeros(n, n);  % initialize output matrix
for i = 1 : n
    l = M(:, i);  % i-th column if inverse of L
    X(:, i) = upTriangSolve(U, l);
end