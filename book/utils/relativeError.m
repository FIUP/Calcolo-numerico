function [error] = relativeError(approximation, correctValue)
% RELATIVEERROR Simply calculates absolute error of input.
%
% [error] = relativeError(approximation, correctValue)
%
% Input:
% approximation - the value guessed
% correctValue - the correct value
%
% Output:
% error - relative error of approximation

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

error = correctValue - approximation;