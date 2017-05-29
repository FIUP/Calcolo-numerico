function [v] = exercise5_4 ()
% EXERCISE5_4 Solves exercse 5.4 of book.
%
% exercise5_4 ()
%
% Finds eigenvalues of matrix after transforming it to upper Hessenberg
% form.

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
    1.982 -0.4319 0.4457 -0.0662;
    -0.2753 2.0979 -0.08 0.1075;
    1.9984 -0.1763 1.9943 0.9796;
    -0.0183 -0.1738 0.1371 3.9259;
];  % input matrix


%% Transform to upper Hessenberg
[H] = givensTransform(A);

%% Finds eigenvalues with qr
[v, k] = qrNoShift(H, 1e-8, 100);
v = diag(v);  % take only eigenvalues
