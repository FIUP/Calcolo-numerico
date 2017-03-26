function [o] = squaredMultiplications (n)
% SQUAREDMULTIPLICATIONS Evaluates f(n) for n. f(n) is defined to be
% (sqrt((n) / (n - 1) * (n - 1) / (n - 2) * ... * 1 / 1)) ^ 2 *
%  (n - 1) / (n) * (n - 2) / (n - 1) * ... * 1 / 1
%
% [o] = squaredMultiplications (n)
%
% Input:
% n - the integer to copmute the function f(n)
%
% Output:
% o - f(n) computed with no smart approximations

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

%% First part:
% o = (Prod[i = 0 to n - 2] (n - i) / (n - i - 1) ) * (n - (n - 1)) / 1

o = (n - (n - 1)) / 1.0;
for i = 0 : n - 2
    o = o * (n - i) / (n - i - 1);
end

%% Second part:
% o = sqrt(o) ^ 2

o = sqrt(o);
o = o ^ 2;

%% Third part:
% o = (Prod[i = 0 to n - 2] (n - i - 1) / (n - i) ) * 1 / (n - (n - 1))

o = o * 1 / (n - (n - 1));
for i = 0 : n - 2
    o = o * (n - i - 1) / (n - i);
end