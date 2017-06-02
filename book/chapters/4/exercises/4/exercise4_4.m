function [x] = exercise4_4 ()
% EXERCISE4_4 Solves exercse 4.4 of book.
%
% exercise4_4 ()
%
% Solve linear system with Gauss-Doolitle LU factorization

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
    3 2 0 0 0 0 0;
    3 4 -1 2 0 0 0;
    -1 -1 5 1 0 0 0;
    2 0 -4 -6 0 0 0;
    0 0 2 1 8 3 -1;
    2 1 1 1 1 -4 0;
    0 1 0 2 0 -1 5;
];  % unknown matrix
b = [-1 -21.6 13.7 12.6 58.9 6.8 68.3]';  % known terms


%% Solve
[L, U] = gaussLuDoolittle(A);
[y] = lowTriangSolve(L, b);  % get y
[x] = upTriangSolve(U, y);  % compute solution
