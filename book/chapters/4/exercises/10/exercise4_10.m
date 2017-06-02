function exercise4_10 ()
% EXERCISE4_10 Solves exercse 4.10 of book.
%
% exercise4_10 ()
%
% Compare Gauss-Seidel and Jacobi methods on solving a linear system.

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
     4 -1 0 -1 0 0;
     -1 4 -1 0 -1 0;
     0 -1 4 0 0 -1;
     -1 0 0 4 -1 0;
     0 -1 0 -1 4 -1;
     0 0 -1 0 -1 4;
];  % input matrix
b = [2 1 2 2 1 2]';  % known terms

toll = 1e-8;
kmax = 40;
x0 = zeros(6, 1);
xSolution = ones(6, 1);  % correct solution of Ax = b
figure  % initalize plot

%% Jacobi method
errors = [];  % i-th element is the error of the algorithm at the i-th iteration
n = size(A, 1);
k = 0;
x = x0;
testToll = toll + 1;
xHelper = zeros(n, 1);

while testToll > toll & k < kmax
    k = k + 1;
    errors = [errors log10(norm(x - xSolution))];  % add error
    
    for i = 1 : n
        xHelper(i) = 0;
        for j = 1 : i - 1
            xHelper(i) = xHelper(i) + A(i, j) * x(j);
        end
        
        for j = i + 1 : n
            xHelper(i) = xHelper(i) + A(i, j) * x(j);
        end
        
        xHelper(i) = (b(i) - xHelper(i)) / A(i, i);
    end
    
    testToll = abs(xHelper - x);
    x = xHelper;
end

%% Plot errors
plot(linspace(1, k, k), errors, '-');  % plot iterations
hold on  % wait before showing plot

%% Gauss-Seidel method
errors = [];  % i-th element is the error of the algorithm at the i-th iteration
n = size(A, 1);
k = 0;
x = x0;
r = b - A * x;
testToll = norm(r);
toll = toll * norm(b);
while testToll > toll && k < kmax
    k = k + 1;
    errors = [errors log10( norm(x - xSolution))];  % add error

    for i = 1 : n
        x(i) = 0;
        for j = 1 : i - 1
            x(i) = x(i) + A(i, j) * x(j);
        end
        
        for j = untitled.figi + 1 : n
            x(i) = x(i) + A(i, j) * x(j);
        end
        
        x(i) = (b(i) - x(i)) / A(i, i);
    end
    
    r = b - A * x;
    testToll = norm(r);
end

%% Plot errors
plot(linspace(1, k, k), errors, '--');  % plot iterations
hold on  % wait before showing plot

%% Prettify plot
xlabel('iterations');  % add axis labels to plot
ylabel('log10 of error of solution');
title('Gauss-Seidel VS Jacobi');  % add title
legend('Jacobi', 'Gauss-Seidel');  % add legend
hold off  % release lock and show plot
