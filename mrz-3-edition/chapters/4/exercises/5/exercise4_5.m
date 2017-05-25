function [x] = exercise4_5 ()
% EXERCISE4_5 Solves exercse 4.5 of book.
%
% exercise4_5 ()
%
% Solve linear system with Gauss-Crout LU factorization of 4D Hilbert
% matrix.

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

A = hilb(4);  % Hilbert matrix
b = [1 1 1 1]';  % known terms


%% Solve
[L, U] = gaussLuCrout(A);
[y] = lowTriangSolve(L, b);  % get y
[x] = upTriangSolve(U, y);  % compute solution
