function [y] = aitken (x)
% AITKEN accelerates convergence of sequence of x_i.
%
% [y] = aitken (x)
%
% Input:
% x - array of x_i converging to a
%
% Output:
% y - ultimate value

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

yValues = zeros(length(x) - 2);
for n = 1 : length(x) - 2
    yValues(n) = x(n) - (x(n + 1) - x(n))^2 / (x(n + 2) - 2 * x(n + 1) + x(n));
end
y = yValues(length(yValues));  % return last value