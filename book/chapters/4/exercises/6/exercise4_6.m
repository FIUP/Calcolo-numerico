function [x] = exercise4_6 ()
% EXERCISE4_6 Solves exercse 4.6 of book.
%
% exercise4_6 ()
%
% Solve tridiagonal linear system with Thomas LU factorization.

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

A = [
     5 -1  0  0  0;
    -3  5 -1  0  0;
     0 -3  5 -1  0;
     0  0 -3  5 -1;
     0  0  0 -3  5;
];  % matrix
b = [4 1 1 1 2]';  % known terms


%% Solve
[L, U] = gaussLuCrout(A);
[y] = lowTriangSolve(L, b);  % get y
[x] = upTriangSolve(U, y);  % compute solution
