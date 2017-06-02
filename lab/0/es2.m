%% Exercise 2
% Compare single/double precision operations.

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

format long;  % set digits precision

%% Input
x = 123456789.0;  % input
y = 123456788.0;

%% Compure sum and difference
s = x + y;
d = x - y;

%% Single precision
sSingle = single(x) + single(y);
dSingle = single(x) - single(y);