function exercise7_5 ()
% EXERCISE7_5 Solves exercise 7.5 of book. Calculates integral with
% Simpson rule.
%
% exercise7_5 ()

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

f = @(x) sqrt(x ^ 2 + 9);  % function to integrate
intervalStart = 0;  % interval
intervalEnd = 4;
exactValue = 10 + 9 / 2 * log(3);  % exact value of integral
testTollStop = 1;  % stop calculating approximation when this < 1e-8
m = 1;

%% Calculate results
while testTollStop > 1e-8
    m = 2 * m;  % number of points with which to calculate approximation
    
    %% Trapezoidal rule
    approxI = simpson(f, intervalStart, intervalEnd, m);  % calculate
    disp(['Trapezoidal rule with m = ' num2str(m)]);
    errAbs = abs(approxI - exactValue)  % calculate errors
    errRel = errAbs / abs(exactValue)
    
    %% Update stop test
    testTollStop = errAbs;
end