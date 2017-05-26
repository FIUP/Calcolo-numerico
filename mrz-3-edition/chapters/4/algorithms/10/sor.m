function [x, k] = sor(A, b, x0, toll, kmax, o)
% SOR: Solve Ax = b with SOR method
%
%  [x, k] = sor(A, b, x0, toll, kmax, o)
%
% Input:
% A - Matrix n x n
% b - vector of known terms
% x0 - starting vector
% toll - max error tolerance
% kmax - max number of iterations
% o - float in ]0, 2[
%
% Output:
% x - solution of Ax = b
% k - number of iterations done

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


n = size(A, 1);
k = 0;
x = x0;
r = b - A * x;
testToll = norm(r);
toll = toll * norm(b);
xHelper = zeros(n, 1);
while testToll > toll && k < kmax
    k = k + 1;
    for i = 1 : n
        xHelper(i) = 0;
        for j = 1 : i - 1
            xHelper(i) = xHelper(i) + A(i, j) * xHelper(j);
        end
        
        for j = i + 1 : n
            xHelper(i) = xHelper(i) + A(i, j) * x(j);
        end
        
        xHelper(i) = (b(i) - xHelper(i)) / A(i, i);
        xHelper(i) = x(i) + o * (xHelper(i) - x(i));
    end
    
    x = xHelper;
    r = b - A * x;
    testToll = norm(r);
end