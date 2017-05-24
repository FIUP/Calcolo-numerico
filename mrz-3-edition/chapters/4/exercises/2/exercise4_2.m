function exercise4_2 ()
% EXERCISE4_2 Solves exercse 4.2 of book.
%
% exercise4_2 ()
%
% Compute L, U matrices with Gauss pivoting method. Store also the
% permutation vector. Then calculate solution.

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

[~, ~, U, y] = gaussPivotingWithPermutationSolver([
        10 7 1 -1 2;
        3 1 -3 7 8;
        -4 7 2 4 2
        9 -1 2 -3 5;
        6 -6 4 9 1
    ], [14 19 21 8 16]');
upTriangSolver(U, y)
