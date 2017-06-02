function exercise7_3 ()
% EXERCISE7_3 Solves exercise 7.3 of book. Compare trapezoidal rule and
% Romberg method to solve integral.
%
% exercise7_3 ()

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

f = @(x) 1 / x;  % function to integrate
intervalStart = 1;  % interval
intervalEnd = 3;
exactValue = log(3) - log(1);  % exact value of integral
xVals = linspace(0, 4, 5);  % x values

%% Calculate results
for i = 1 : length(xVals)
    m = 2 ^ i;  % number of points with which to calculate approximation
    
    %% Trapezoidal rule
    approxI = trapezoidalRule(f, intervalStart, intervalEnd, m);  % calculate
    disp(['Trapezoidal rule with m = ' num2str(m)]);
    errAbs = abs(approxI - exactValue)  % calculate errors
    errRel = errAbs / abs(exactValue)
    
    %% Romberg method
    approxI = romberg(f, intervalStart, intervalEnd, m, 5);  % calculate
    disp(['Romberg method with m = ' num2str(m)]);
    errAbs = abs(approxI - exactValue)  % calculate errors
    errRel = errAbs / abs(exactValue)
end