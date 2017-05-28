function exercise7_2 ()
% EXERCISE7_2 Solves exercise 7.2 of book. Compare trapezoidal rule, Simpson
% method and Romberg algorithm to calculate value of integral.
%
% exercise7_2 ()
%
% Output:
% void - plots chart with error values.

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

f = @(x) exp(x) * cos(x);  % function
intervalStart = 0;  % interval
intervalEnd = pi;
exactValue = -12.0703463164;  % exact value of integral

xVals = linspace(1, 9, 10);  % x value of plot
trapYVals = zeros(1, 9);  % y value: trapezoidal approximation
simpsonYVals = zeros(1, 9);  % y value: simpson approximation
rombergYVals = zeros(1, 9);  % y value: romberg approximation

%% Calculate results
for i = 1 : length(xVals)
    m = 2 ^ i;  % number of points with which to calculate approximation
    
    %% Trapezoidal rule
    approxI = trapezoidalRule(f, intervalStart, intervalEnd, m);  % calculate
    errAbs = abs(approxI - exactValue);  % calculate errors
    errRel = errAbs / abs(exactValue);
    trapYVals(i) = -log10(errRel);
    
    %% Simpson method
    approxI = simpson(f, intervalStart, intervalEnd, m);  % calculate
    errAbs = abs(approxI - exactValue);  % calculate errors
    errRel = errAbs / abs(exactValue);
    simpsonYVals(i) = -log10(errRel);
    
    %% Romberg method
    approxI = romberg(f, intervalStart, intervalEnd, m, 5);  % calculate
    errAbs = abs(approxI - exactValue);  % calculate errors
    errRel = errAbs / abs(exactValue);
    rombergYVals(i) = -log10(errRel);
end

%% Plot
figure  % initalize plot
plot(xVals, trapYVals, 'x-'); hold on
plot(xVals, simpsonYVals, '--'); hold on
plot(xVals, rombergYVals, '.-'); hold on

%% Prettify plot
xlabel('points (log2 scale)');  % add axis labels to plot
ylabel('-log10 of error');
title('Trapezoidal rule VS Simpson VS Romberg');  % add title
legend('Trapezoidal rule', 'Simpson method', 'Romberg method');  % add legend
hold off  % release lock and show plot