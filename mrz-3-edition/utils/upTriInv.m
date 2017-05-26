function [M] = upTriInv(L)
% UPTRIINV Finds L^-1 given that L is a upper triangular
% matrix. Just solve the system LM = I => M = L^-1 * I = L^-1
%
%  [M] = upTriInv(L)
%
% Input:
% L - upper triangular matrix
%
% Output:
% M - L^-1

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

n = size(L, 1);  % number of columns
I = eye(n);
M = zeros(n, n);  % prepare matrix
for i = 1 : n
    e = I(i, :);  % get i-th canonical vector
    M(:, i) = upTriangSolve(L, e);
end