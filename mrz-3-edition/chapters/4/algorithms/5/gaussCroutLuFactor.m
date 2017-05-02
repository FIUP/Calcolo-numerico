function [L, U] = gaussCroutLuFactor(A)
% GAUSSCROUTLUFACTOR: Get L, U matrices from A such that LU = A and L, U
% are triangular.
%
%  [L, U] = gaussCroutLuFacto(Ab)
%
% Input:
% A - Matrix n x n
%
% Output:
% L - L low triangular matrix of LU-factorization
% U - U upper triangular matrix of LU-factorization

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


n = size(A, 1);  % number of rows of A
L = zeros(n, n);  % pre-allocate memory
U = zeros(n, n);
for i = 1 : n
    L(i, 1) = A(i, 1);
    U(1, i) = A(1, i) / L(1, 1);
end
for j = 2 : n
    U(j, j) = 1;
    for i = j : n
        L(i, j) = A(i, j);
        for k = 1 : j - 1
            L(i, j) = L(i, j) - L(i, k) * U(k, j);
        end
    end
    for i = j + 1 : n
        U(j, i) = A(j, i);
        for k = 1 : j - 1
            U(j, i) = U(j, i) - L(j, k) * U(k, i);
        end
        U(j, i) = U(j, i) / L(j, j);
    end
end