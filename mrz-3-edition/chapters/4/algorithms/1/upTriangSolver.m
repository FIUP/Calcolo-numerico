function [x] = upTriangSolver(U, b)
% UPTRIANGSOLVER: Solves Ux = b where U is a upper triangular matrix
%
%  [x] = upTriangSolver(U, b)
%
% Input:
% U - upper triangular matrix
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

n = size(U, 1);  % num of rows (= num of columns)
x = zeros(1, n);
for i = n : -1 : 1
    x(i) = b(i);
    for j = i + 1 : n
        x(i) = x(i) - U(i, j) * x(j);
    end
    x(i) = x(i) / U(i, i);
end
x = x';  % array -> vector