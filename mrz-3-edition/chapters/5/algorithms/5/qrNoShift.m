function [A, k] = qrNoShift(A, toll, kmax)
% QRNOSHIFT: finds eigenvalues of hessenberg matrix using no-shift qr method.
%
%  [A, k] = qrNoShift(A, toll, kmax)
%
% Input:
% A - matrix
% toll - min tolerance of output error
% kmax - max number of iterations
%
% Output:
% A - input matrix
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

n = size(A, 1);  % number of rows
k = 0;

%% Calculate initial tolerance
testToll = -inf;  % max |A(i + 1, i)|
for i = 1 : n - 1
    if abs(A(i + 1, i)) > testToll
        testToll = abs(A(i + 1, i));
    end
end

%% Iterate
while testToll >= toll && k < kmax
    k = k + 1;
    Q = eye(n);
    for r = 1 : n - 1
        s = 1;
        if A(r, r) < 0
            s = -1;
        end
        
        tmp = -s * sqrt(A(r, r) ^ 2 + A(r + 1, r) ^ 2);
        v = tmp * (tmp - A(r, r));
        w = zeros(n, 1);  % zero array
        w(r) = A(r, r) - tmp;
        w(r + 1) = A(r + 1, r);
        A(r, r) = tmp;
        A(r + 1, r) = 0;
        
        for j = r + 1 : n
            g = (w(r) * A(r, j) + w(r + 1) * A(r + 1, j)) / v;
            A(r, j) = A(r, j) - g * w(r);
            A(r + 1, j) = A(r + 1, j) - g * w(r + 1);
        end
        
        Qr = eye(n) - w * w' / v;
        Q = Q * Qr;
    end
    
    A = A * Q;
    
    %% Re-calculate toll
    testToll = -inf;  % max |A(i + 1, i)|
    for i = 1 : n - 1
        if abs(A(i + 1, i)) > testToll
            testToll = abs(A(i + 1, i));
        end
    end
end