function [c] = fromBase10FractionalPartConversion (a, b, m)
% FROMBASE10FRACTIONALPARTCONVERSION Convert a fractional part of a number
%     from base 10 to number c in base b (with at most m decimal places)
%
% [c] = fromBase10FractionalPartConversion (a, b, m)
%
% Input:
% a - fractional part of number to convert from base 10 to base b
% b - base form which convert number a; b must >= 2
% m - max number of precision digits in result
%
% Output:
% c - fractional part of number converted from base 10 to base b
%     (array-like)

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

current_fractional_part = a;  % decimal part used in multplications
c = [];  % result array-like
for decimal_places_current_precision = 0 : m
    current_fractional_part = current_fractional_part * b;
    int_part = floor(current_fractional_part);
    c = [c int_part];  % add just computed decimal digit
    current_fractional_part = current_fractional_part - int_part;  % get only fractional part
end