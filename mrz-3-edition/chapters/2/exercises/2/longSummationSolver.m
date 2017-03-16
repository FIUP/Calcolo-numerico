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

function [c] = polynomialDerivativeEvaluationInPoint (p, x)
% POLYNOMIALDERIVATIVEEVALUATIONINPOINT
%     Compute derivative of polynomial at given point
%
% [c] = polynomialDerivativeEvaluationInPoint (p, x)
%
% Input:
% p - array-like coefficients of polynomial
%     e.g
%         polynomial: x^4 + 3x + 2
%                     x^4 + 0 * x^3 + 0*x^2 + 3*x + 2
%         p         : 4, 0, 0, 3, 2
% x - point where to evaluate derivative of p
%
% Output:
% c - value of derivative of p in x

n = length(p);  % get number of coefficients
degree = n - 1;  % degree of the polynomial
c = 0;  % result array-like
for i = 1 : n - 1
    current_degree = degree + 1 - i;  % current degree of the expansion
    current_coefficient = p(i);  % polynomial coefficient of the expansion
    exp_degree = degree - i;  % degree at which x is to be raised now
    c = current_degree * current_coefficient * x ^ exp_degree + c;
end