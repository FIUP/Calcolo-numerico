function [A, V, nr] = jacobiEigen(A, toll, nmax)
% JACOBIEIGEN: finds eigenvalues and eigenvectors of matrix using classic
% Jacobi method
%
%  [A, V, nr] = jacobiEigen(A, toll, nmax)
%
% Input:
% A - simmetric matrix
% toll - min tolerance of output error
% nmax - max number of iterations (rotations)
%
% Output:
% A - input matrix with eigenvalues on diagonal
% V - matrix: each column is an eigenvector of A
% nr - number of rotations done

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
V = eye(n);
nr = 0;

%% Calculate initial tolerance
testToll = 0;
for q = 1 : n
    for p = 1 : q - 1
        testToll = testToll + abs(A(p, q)) ^ 2;
    end
end
testToll = 2 * testToll;

while testToll > toll && nr < nmax
    %% p, q such that |A(p, q)| = max|A(i, j)|, i < j
    p = 0;
    q = 0;
    maxV = -inf;
    for j = 1 : n
        for i = 1 : j - 1
            if A(i, j) > maxV  % found such p, q
                p = i;
                q = j;
                maxV = A(i, j;
            end
        end
    end
    
    %% Perform rotation
    u = (A(p, p) - A(q, q)) / (2 * A(p, q));
    t = 1 / (abs(u) + sqrt(1 + u ^ 2));
    if u < 0
        t = -t;
    end
    c = 1 / sqrt(1 + t ^ 2);
    s = t * c;
    tau = s / (1 + c);
    A(p, p) = A(p, p) + t * A(p, q);
    A(q, q) = A(q, q) - t * A(p, q);
    testToll = testToll - 2 * A(p, q) ^ 2;
    A(p, q) = 0;
    
    for i = 1 : p - 1
        tmp = A(i, p);
        A(i, p) = A(i, p) + s * (A(i, q) - tau * A(i, p));
        A(i, q) = A(i, q) - s * (tmp + tau * A(i, q));
    end
    
    for i = p + 1 : q - 1
        tmp = A(p, i);
        A(p, i) = A(p, i) + s * (A(i, q) - tau * A(p, i));
        A(i, q) = A(i, q) - s * (tmp + tau * A(i, q));
    end
    
    for i = q + 1 : n
        tmp = A(p, i);
        A(p, i) = A(p, i) + s * (A(q, i) - tau * A(p, i));
        A(q, i) = A(q, i) - s * (tmp + tau * A(q, i));
    end
    
    for i = 1 : n
        tmp = V(i, p);
        V(i, p) = V(i, p) + s * (V(i, q) - tau * V(i, p));
        V(i, q) = V(i, q) - s * (tmp + tau * V(i, q));
    end
    
    for j = 1 : n - 1
        for i = j + 1 : n
            A(i, j) = A(j, i);
        end
    end
    
    nr = nr + 1;  % update rotation counter
end