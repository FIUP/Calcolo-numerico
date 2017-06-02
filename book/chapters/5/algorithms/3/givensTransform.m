function [H] = givensTransform(A)
% GIVENSTRANSFORM: Turn A into upper Hessenberg matrix using Givens
% rotation matrix.
%
%  [H] = givensTransform(A)
%
% Input:
% A - matrix
%
% Output:
% H - upper Hessenberg matrix

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

n = size(A, 1);  % number of rows

for k = 1 : n - 2
    for i = k + 2 : n
        alpha = sqrt(A(k + 1, k) ^ 2 + A(i, k) ^ 2);
        c = A(k + 1, k) / alpha;
        s = A(i, k) / alpha;
        A(k + 1, k) = alpha;
        A(i, k) = 0;
        
        for j = k + 1 : n
            tmp = A(k + 1, j) * c + A(i, j) * s;
            A(i, j) = - A(k + 1, j) * s + A(i, j) * c;
            A(k + 1, j) = tmp;
        end
        
        for j = 1 : n
            tmp = A(j, k + 1) * c + A(j, i) * s;
            A(j, i) = - A(j, k + 1) * s + A(j, i) * c;
            A(j, k + 1) = tmp;
        end
    end
end
H = A;