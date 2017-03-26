function [direct, horner] = hornerVSAll (a, x)
% HORNERVSALL Evaluation of polynomial in given point with and without
% Horner method
%
% [direct, horner] = hornerVSAll (a, x)
%
% Given the polynomial written as a0 * x^n + a1 * x^(n-1) + ... + an,
% employes Horner evaluation to evaluate it in point.
%
% Input:
% a - array: a[i] is the i-th coeffient of the polynomial
% x - point where to evaluate polynomial
%
% Output:
% direct - polynomial evaluaton without Horner method
% horner - polynomial evaluaton with Horner method

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

direct = polynomialEvaluationInPoint(a, x);  % compute the 2 values
horner = polynomialHornerEvaluationInPoint(a, x);