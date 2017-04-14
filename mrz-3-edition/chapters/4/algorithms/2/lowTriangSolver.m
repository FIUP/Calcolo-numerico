function [x] = lowTriangSolver(L, b)
% LOWTRIANGSOLVER: Solves Lx = b where U is a lower triangular matrix
%
%  [x] = lowTriangSolver(L, b)
%
% Input:
% L - lower triangular matrix
% b - known terms
%
% Output:
% x - solution of Ux = b

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

n = size(L, 1);  % num of rows (= num of columns)
x = zeros(1, n);  % pre-allocate
for i = 1 : n
    x(i) = b(i);
    for j = 1 : i - 1
        x(i) = x(i) - L(i, j) * x(j);
    end
    x(i) = x(i) / L(i, i);
end
x = x';  % array -> vector