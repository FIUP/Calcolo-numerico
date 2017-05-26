function [x, r, k] = gradPc(A, M, b, x0, toll, kmax)
% GRADPC: Solve Ax = b with preconditioned gradient method
%
%  [x, k] = gradPc(A, b, x0, toll, kmax)
%
% Input:
% A - n x n matrix
% M - approximation of A such that Mz = r is easy to solve
% b - vector of known terms
% x0 - starting vector
% toll - max error tolerance
% kmax - max number of iterations
%
% Output:
% x - solution of Ax = b
% r - residue vector
% k - number of iterations done

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


n = size(A, 1);
k = 0;
x = x0;
r = b - A * x;
% solve Mz = r
pOld = r' * r;
testToll = (toll * toll) * (b' * b);

while pOld > testToll && k < kmax
    k = k + 1;
    v = A * z;
    g = pOld / z' * v;
    x = x + g * z;
    r = r - g * v;
    % solve Mz = r
    pNew = r' * z;
    a = pNew / pOld;
    z = r + a * z;
    pOld = pNew;
end