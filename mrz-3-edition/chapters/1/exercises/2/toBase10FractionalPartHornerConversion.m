%{
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
%}


function [c] = toBase10FractionalPartHornerConversion (a, b)
% FROMBASE10CONVERSION Convert number a from base 10 to number c in base b
%
% [c] = toBase10FractionalPartHornerConversion (a, b)
%
% Input:
% a - fractional part of number to convert from base b; a should be an
%     array so that each digit is an array item
% b - base form which convert number a; b must >= 2
%
% Output:
% c - fractional part of number converted from base b to base 10

n = length(a);  % length of fractional part
c = a(n) / b;
for i = n - 1 : -1 : 1
    c = (c + a(i)) / b;  % Horner conversion
end