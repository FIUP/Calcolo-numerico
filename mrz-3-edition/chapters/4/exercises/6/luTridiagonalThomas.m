function [L, U] = luTridiagonalThomas(A)
% LUTRIDIAGONALTHOMAS: Factorization of tridiagonal matrix in lower triangular
% and upper triangular matrix using Thomas algorithm.
%
%  [L, U] = luTridiagonalThomas(A)
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
U(1, 1) = A(1, 1);
for i = 2 : n
    L(i, i -1) = A(i, i - 1) / U(i - 1, i - 1);
    U(i, i) = A(i, i) * L(i, i - 1) * B(i - 1, i);
end
