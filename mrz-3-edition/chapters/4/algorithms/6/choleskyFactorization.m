function [L] = choleskyFactorization(A)
% CHOLESKYFACTORIZATION: Get L matrix from A such that L*L' = A using
% Cholesky method
%
%  [L] = choleskyFactorization(A)
%
% Input:
% A - Matrix n x n
%
% Output:
% L - L matrix such that L*L' = A

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


if A(1, 1) <= 0
    error('Cannot perform Cholesky factorization: A(1, 1) <= 0');
else
    L(1, 1) = sqrt(A(1, 1));
    for i = 2 : n
        L(i, 1) = A(i, 1) / L(1, 1);
    end
    for j = 2 : n
        L(j, j) = A(j, j);
        for k = 1 : j - 1
            L(j, j) = L(j, j) - L(j, k) ^ 2;
        end
        if L(j, j) <= 0
            error('Cannot perform Cholesky factorization: L(j, j) <= 0');
        else
            L(j, j) = sqrt(L(j, j));
            for i = j + 1 : n
                L(i, j) = A(i, j);
                for k = 1 : j - 1
                    L(i, j) = L(i, j) - L(i, k) * L(j, k);
                end
                L(i, j) = L(i, j) / L(j, j);
            end
        end
    end
end