function exercise4_3 ()
% EXERCISE4_3 Solves exercse 4.3 of book.
%
% exercise4_3 ()
%
% Compare Gauss without pivoting, partial pivoting and complete pivoting
% methods.

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
    0.2641 0.1735 0.8642 0.1456;
    0.9411 0.0175 0.1463 0.3425;
    -0.8641 0.4243 0.0711 0.3421;
    0.1342 0.0934 0.1239 0.1902
];  % unknown matrix
b = [-0.7521 0.6310 0.2501 -0.2345]';  % known terms


%% Without pivoting
[~, U, y] = gaussLuSolver(A, b);
xW = upTriangSolver(U, y);  % compute solution

%% Partial pivoting
[~, ~, U, y] = gaussPivotingWithPermutationSolver(A, b);
xP = upTriangSolver(U, y);  % compute solution

%% Complete pivoting
[~, Q, ~, U, y] = gaussTotalPivotingWithPermutationsSolver(A, b);
xC = upTriangSolver(U, y);  % compute solution
for i = 1 : size(xC, 1)  % swap solution
    toSwap = Q(i);
    if i ~= toSwap
        tmp = xC(i);
        xC(i) = xC(toSwap);
        xC(toSwap) = tmp;
        
        tmp = Q(i);
        Q(i) = Q(toSwap);
        Q(toSwap) = tmp;
    end
end

%% Print solution
disp(['   Without   ' 'Partial  ' 'Complete    ' '(pivoting)'])
for r = 1 : size(A, 1)  % number of rows in solution
    disp([xW(r) xP(r) xC(r)])
end
