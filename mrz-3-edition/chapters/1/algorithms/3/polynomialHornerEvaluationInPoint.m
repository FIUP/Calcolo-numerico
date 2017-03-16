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


function [y] = polynomialHornerEvaluationInPoint (a, x)
% POLYNOMIALHORNEREVALUATIONINPOINT Evaluation of polynomial in given point
%
%  [y] = polynomialHornerEvaluationInPoint (a, x)
%
% Given the polynomial written as a0 * x^n + a1 * x^(n-1) + ... + an,
% employes Horner evaluation to evaluate it in point.
%
% Input:
% a - array: a[i] is the i-th coeffient of the polynomial
% x - point where to evaluate polynomial
%
% Output:
% y - value of polynomial in point x

y = a(1);
n = length(a) - 1;  % degree of polynomial
for i = 2 : n + 1  % loop through polynomial coefficients
    y = y * x + a(i);  % use horner evaluation
end