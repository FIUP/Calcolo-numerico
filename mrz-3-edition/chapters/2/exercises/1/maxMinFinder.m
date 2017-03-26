function [firstGreaterThan, firstLowerThan] = maxMinFinder (aMin, aMax)
% MINMAXFINDER Finds
% - the first number greater than the min value input
% - the first number lower than the max value input
%
% [firstGreaterThan, firstLowerThan] = minMaxFinder (aMin, aMax)
%
% Input:
% aMin - the min value
% aMax - the max value
%
% Output:
% firstGreaterThan - the first number greater than the min value input
% firstLowerThan- the first number lower than the max value input

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

firstGreaterThan = aMin + eps * 3;
firstLowerThan = aMax - eps * 3;