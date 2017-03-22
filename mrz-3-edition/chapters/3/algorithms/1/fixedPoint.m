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


function [x, numberOfIterations] = fixedPoint(f, startPoint, tolerance, maxIterations)
% FIXEDPOINT: Finds a solution of x = f(x) with the classic fixed-point
% method.
%
%  [x] = fixedPoint(f, startPoint, tolerance, maxIterations)
%
% Input:
% f - 'f' function in the equation 'x = f(x)'
% startPoint - starting point of method
% tolerance - epsilon at which stop method (i.e when |f(xn) - xn| <
%             epsilon)
% maxIterations - max number of iterations to execute
%
% Output:
% x - approximation of solution of 'f(x) = x'
% numberOfIterations - number of iterations executed before getting
%                      solution

numberOfIterations = 0;
x = startPoint;
deltaDiff = tolerance * 2;  % initialize diff
while deltaDiff >= tolerance && numberOfIterations < maxIterations
    numberOfIterations  = numberOfIterations + 1;  % increase counter
    xOld = x;
    x = feval(f, x);  % evaluate function in x
    deltaDiff = abs(x - xOld);  % update diff
end