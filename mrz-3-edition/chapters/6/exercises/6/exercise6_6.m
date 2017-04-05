function exercise6_6 ()
% EXERCISE6_6 Solves exercse 6.6 of book.
%
% exercise6_6 ()
%
% Compare recursive and binomial way to compute the forward differences
% table for a given function and a set of nodes.

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

format long

%% Input
f = @(x) sqrt(x);  % function
intervalStart = 2;  % interval
intervalEnd = 2.4;
trainPointsCount = 5;  % how much points to sample
xTrain = linspace(intervalStart, intervalEnd, trainPointsCount);  % sample points
yTrain = f(xTrain);

%% Recursive method
table = forwardFiniteDifferencesTable(xTrain, yTrain, []);
diag(flip(table))'  % display diagonal elements

%% Binomial way
table = lazyForwardFiniteDifferencesTable(xTrain, yTrain, []);
diag(flip(table))'  % display diagonal elements