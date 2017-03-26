function [e] = laguerre ()
% EPSESTIMATION Simple Cleve-Moler algorithm to evaluate machine precision
%
%  [e] = epsEstimation ()
%
% Output:
% e - eps (machine precision)

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

x = 4.0/3.0;  % 4/3
y = x - 1.0;  % 4/3 - 1 = 1/3
z = y + y + y;  % 1/3 + 1/3 + 1/3 = 3/3 = 1
e = abs(z - 1.0);  % 1 - 1 = 0