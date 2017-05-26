function [x] = exercise4_9 ()
% EXERCISE4_9 Solves exercse 4.9 of book.
%
% exercise4_9 ()
%
% Factor a matrix with Cholesky method.

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
     9.5 -1.3 0.5 1.2 0.1;
     -1.3 8.0 0.3 0.1 0.4;
     0.5 0.3 5.1 0.7 1.2;
     1.2 0.1 0.7 5.2 2.1;
     0.1 0.4 1.2 2.1 3.0;
];  % input matrix

[L] = cholesky(A);  % find cholesky factorization
disp('Cholesky error')
abs(L * L' - A)
