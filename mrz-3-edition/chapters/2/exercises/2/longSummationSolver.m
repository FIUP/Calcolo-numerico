function [s] = longSummationSolver (a)
% LONGSUMMATIONSOLVER Gets the sum of the doubles in the array
%
% [s] = longSummationSolver (a)
%
% Input:
% a - array of doubles
%
% Output:
% s - value of the sum of numbers in array

%% Idea: sort array, then sum starting from the little numbers. This way
%  we can reduce errors due to machine precision.

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

a = sort(a);  % sort array
n = length(a);  % array length
s = 0;  % sum value
for i = 1 : n
    s = a(i) + s;
end