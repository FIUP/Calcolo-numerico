function [c] = toBase10HornerConversion (a, b)
% TOBASE10HORNERCONVERSION Convert number a from base 10 to number c in base b
%
% [c] = fromBase10Conversion (a, b)
%
% Input:
% a - integer number to convert from base b; a should be an array so that
%     each digit is an array item; a should be >= 0
% b - base form which convert number a; b must >= 2
%
% Output:
% c - number a converted from base b to base 10

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

n = length(a);  % number of digits in a
c = 0;
for i = 1 : n  % loop through digits in reversed order
    c = c + a(i) * b ^ (n - i);  % increase converter decimal number
end