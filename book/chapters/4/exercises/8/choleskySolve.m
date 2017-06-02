function [x] = choleskySolve(A, b)
% CHOLESKY: Solve Ax = b with Cholesky factorization.
%
%  [x] = choleskySolve(A, b)
%
% Input:
% A - Matrix n x n
% b - vector of known terms
%
% Output:
% x - solution of Ax = b

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


[L] = cholesky(A);  % factor input matrix
U = L';  % get upper matrix from lower matrix
[y] = lowTriangSolve(L, b);  % get y
[x] = upTriangSolve(U, y);  % compute solution