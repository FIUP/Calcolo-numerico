function [H, Q] = householderTransform(A)
% GIVENSTRANSFORM: Turn A into upper Hessenberg matrix using Householder
% method.
%
%  [H] = givensTransform(A)
%
% Input:
% A - matrix
%
% Output:
% H - upper Hessenberg matrix
% Q - ortogonal matrix such that A = Q * H * Q'

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
Q = eye(n);
w = zeros(n, 1);

for k = 1 : n - 2
    tmp = 0;
    
    for i = k + 1 : n
        tmp = tmp + A(i, k) ^ 2;
    end
    tmp = -sign(A(k + 1, k)) * sqrt(tmp);
    v = tmp * (tmp - A(k + 1, k));
    w(k + 1) = A(k + 1, k) - tmp;
    for i = 1 : k
        w(i) = 0;
    end
    for i = k + 2 : n
        w(i) = A(i, k);
    end
    
    Qk = eye(n) - ((w * w') / v);
    A = Qk * A * Qk;
    Q = Q * Qk;
end
H = A;