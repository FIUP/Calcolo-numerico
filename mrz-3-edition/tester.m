% Some examples of implementations of the numerical anaysis algorithms and
% exercises in book by prof. Michela Redivo Zaglia
% To run scripts in this repository go to Home > Environment > Set Path >
% Add with subfolders > Select this folder

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

clear all; close all; clc;  % remove all values in memory

%% chapter 1
% algorithms
fromBase10Conversion(4, 2);  % 100
polynomialHornerEvaluationInPoint([2, 1, 1], 10);  % 211
toBase10HornerConversion([15, 0, 1], 16);  % 3841

% exercises
toBase10FractionalPartHornerConversion([0, 0, 1], 2);  % 0.1250
fromBase10FractionalPartConversion(1/7, 4, 8);  % [0, 2, 1, 0, 2, 1, 0, 2, 1]
polynomialDerivativeEvaluationInPoint([3, 4, 8, 2, 9], 7);  % 4818

%% chapter 2
% algorithms
epsEstimation();  % 2.2204e-16 (Matlab R2016b in Linux 64bit)
baseComputation();  % 1 (Matlab R2016b in Linux 64bit)
parabolaSolver(1, 4, 1);  % -3.7321, -0.2679

% exercises
maxMinFinder(1.9, 2.0);  % 1.900000000000001, 1.999999999999999 (Matlab R2016b in Linux 64bit)
longSummationSolver([19 * 10^3, 0.4, 5 * 10 ^ (-2), 4.69999999]);  % 1.900514999999000e+04
squaredMultiplicationsTester(2, 3);
    % [ 2,2.22044604925031e-16,2.22044604925031e-16,16;
    % 3,1.11022302462516e-16,1.11022302462516e-16,16 ]
hornerVSAll([10^18, 10 ^ 1, 10^-9], 10^23);  % 9.999999999999999e+63, 9.999999999999999e+63
parabolaSolverSmartVersion(1, 4, 1);  % -3.7321, -0.2679
% parabolaSolverTester(10 ^(-3), 0.8, -6 * 10 ^ (-5), -1 * 10 ^ (-5));  % image 2.2
parabolaSolverComplexVersion(9, 1, 1);  % -0.0556 - 0.3287i, -0.0556 + 0.3287i

%% chapter 3
% algorithms
fixedPoint(@sin, 0.5, 10^(-8), 100);  % 0.1627, 100
newton(@sin, @cos, 1, 10^(-8), 100);  % 0, 5, false
multipleRootsNewton(@(x) x.^2, @(x) 2 * x, 3, 10^(-16), 100, 1);  % 5.551115123125783e-17, 54
halley(@(x) -5 * x.^4 + 6, @(x) -20 * x.^3, @(x) -60 * x.^2, 1, 10^(-16), 100);  % 1.046635139392106, 4
convergenceEvaluation(10 ^ (-16), 100);  % 1.0e+10, 2.0, 1.34e+5, 73
multiplicityEvaluation(@(x) x.^2, @(x) 2 * x, 1, 10^(-16), 100);  % 5.551115123125783e-17, 0.5, 2, 54
% laguerre(); TODO
% bairstow(); TODO

% exercises
whyBisectLikeThis(0.982, 0.984);  % 0.983000000000000, 0.983000000000000
% secantVSNewton(10^(-10), 10^(-10), 2 * 10^(-10), 100);  % image 3.17
% newtonPlotter(2);  % image 3.20
% steffensenPlotter(1);  % exercise 3.4
% bisectionVSAnomymous(1.5);  % exercise 3.5
% exercise3_6();  % exercise 3.6
% exercise3_7();  % exercise 3.7
% exercise3_8();  % exercise 3.8

%% chapter 4
% algorithms
% exercises

%% chapter 5
% algorithms
% exercises

%% chapter 6
% algorithms
% lagrangeApproximate([2.92 3.75 -5.2], [8.24 16.32 2.41], [1.01 1.54 -4.24]);  % [-5.0812 -2.1216 -3.8258]
% nevilleAitkenApproxiate();  % TODO
% dividedDifferencesTable([3 1 5 6], [1 -3 2 4]);  % [1.0000 2.0000 -0.3750 0.1750; -3.0000 1.2500 0.1500 0; 2.0000 2.0000 0 0; 4.0000 0 0 0]
% chebyshevPolynomia();  % TODO
% chebyshevPolynomiaZeros();  % TODO

% exercises
% exercise6_1();  % exercise 6.1
% exercise6_2();  % TODO % exercise 6.2
% exercise6_3();  % TODO % exercise 6.3
% exercise6_4();  % TODO % exercise 6.4
% exercise6_5();  % exercise 6.5
% exercise6_6();  % exercise 6.6
% exercise6_7();  % TODO % exercise 6.7
% exercise6_8();  % TODO % exercise 6.8
% exercise6_9();  % TODO % exercise 6.9
% exercise6_10();  % TODO % exercise 6.10

%% chapter 7
% algorithms
% exercises

%% chapter 8
% algorithms
% exercises