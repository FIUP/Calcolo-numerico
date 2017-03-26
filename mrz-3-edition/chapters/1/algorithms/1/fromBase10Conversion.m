
function [c] = fromBase10Conversion (a, b)
% FROMBASE10CONVERSION Convert number a from base 10 to number c in base b
%
%  [c] = fromBase10Conversion (a, b)
%
% Input:
% a - integer number to convert from base 10; a should be >= 0
% b - base to which convert number a; b must >= 2
%
% Output:
% c - number a converted to base b

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

a = abs(a);  % get absolute value
c = [];
while a ~= 0
    q = floor(a / b);  % quotient
    r = a - q * b;  % remainder
    a = q;
    c = [c, r];  % add new digit
end
c = fliplr(c);  % flip