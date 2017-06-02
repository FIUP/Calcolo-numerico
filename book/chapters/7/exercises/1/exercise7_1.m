function exercise7_1 ()
% EXERCISE7_1 Solves exercise 7.1 of book. Compare trapezoidal rule and
% Simpson method to calculate value of integral.
%
% exercise7_1 ()
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

f = @(x) 1 / (1 + (x - pi) ^ 2);  % function
intervalStart = 0;  % interval
intervalEnd = 5;
exactValue = 2.33976628367;  % exact value of integral
figure  % initalize plot

%% Calculate results
for i = 1 : 9
    m = 2 ^ i;  % number of points with which to calculate approximation
    
    %% Trapezoidal rule
    approxI = trapezoidalRule(f, intervalStart, intervalEnd, m);  % calculate
    errAbs = abs(approxI - exactValue);  % calculate errors
    errRel = errAbs / abs(exactValue);
    numDigitWrong = -log10(errRel);
    
    %% Add to plot
    plot(i, numDigitWrong, 'x');
    hold on  % wait before showing plot
    legendInfo{2 * i - 1} = ['trapezoidal rule with m = ' num2str(m)];  % add legend
    
    %% Simpson method
    approxI = simpson(f, intervalStart, intervalEnd, m);  % calculate
    errAbs = abs(approxI - exactValue);  % calculate errors
    errRel = errAbs / abs(exactValue);
    numDigitWrong = -log10(errRel);
    
    %% Add to plot
    plot(i, numDigitWrong, '.');
    hold on  % wait before showing plot
    legendInfo{2 * i} = ['simpson rule with m = ' num2str(m)];  % add legend
end

%% Prettify plot
xlabel('points (log2 scale)');  % add axis labels to plot
ylabel('-log10 of error');
title('Trapezoidal rule VS Simpson method');  % add title
legend(legendInfo);  % add legend
hold off  % release lock and show plot