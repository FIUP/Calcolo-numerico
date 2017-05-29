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

close all; clc;  % clear memory

%% chapter 1
% algorithms
fromBase10Convert(4, 2);  % 100
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
upTriangSolve([
    1 3;
    0 4
], [3 5]');  % [-0.75 1.25]'
lowTriangSolve([
    1 0;
    3 4
], [3 5]');  % [3 -1]'
[~, U, y] = gaussLu([
    1 7 8;
    1 3 1
    5 4 3
], [9 8 2]');
upTriangSolve(U, y);  % [-1.4348 3.8261 -2.0435]'
[~, U, y] = gaussPivoting([
    1 1 1;
    0 2 5;
    2 5 -1
], [6 -4 27]');
x = upTriangSolve(U, y);  % [5 3 -2]'
gaussLuCrout([4 2 1; 9 8 7; 2 2 9]);  % [4 0 0; 9 3.5 0; 2 1 7.1429], [1 0.5 0.25; 0 1 1.3571; 0 0 1]
cholesky([74 31 100; 31 54 89; 100 89 226]);  % [8.6023 0 0; 3.6037 6.4042 0; 11.6248 7.3558 6.0627]

% exercises
gaussPivotingPerm([
    2 1 3;
    4 3 10;
    2 4 17
    ], [11 28 31]');  % example 4.3 in book with exercise 4.1 function
exercise4_2();  % [0.1546 1.2336 1.9710 1.4386 1.6432]'
% exercise4_3();  % [7.5383 31.3009 -6.4753 -17.7043]'
exercise4_4();  % [3.8 -6.2 2.8 -2.7 8.7 0.85 16.15]'
exercise4_5();  % [-4 60 -180 140]'
exercise4_6();  % [1 1 1 1 1]'
gaussInvert([
    5 -1 3 2 -4;
    -3 7 -1 1 3;
    4 2 -3 8 3;
    3 -3 6 -1 2;
    1 -4 2 -3 7;
]);  % exercise 4.7
choleskySolve([
    5 7 6 5;
    7 10 8 7;
    6 8 10 9;
    5 7 9 10;
], [23 32 33 31]');  % exercise 4.8
% exercise4_9();  % 1.0e-14 * ...
% exercise4_10();  % see image
% exercise4_11();  % see image
% exercise4_12();  % see image
[x, r, k] = gradConjugate([
    60 -31 26 33 -28;
    -31 79 -42 36 -15;
    26 -42 59 -31 20;
    33 36 -31 79 -52;
    -28 -15 20 -52 87;
], [60 27 32 65 12]', zeros(5, 1), 1e-10, 20);  % exercise 4.13, [1 1 1 1 1]'

%% chapter 5
% algorithms
% exercises

%% chapter 6
% algorithms
% lagrangeApproximate([2.92 3.75 -5.2], [8.24 16.32 2.41], [1.01 1.54 -4.24]);  % [-5.0812 -2.1216 -3.8258]
% nevilleAitkenApproxiate();  % TODO
% dividedDifferencesTable([3 1 5 6], [1 -3 2 4]);  % [1.0000 2.0000 -0.3750 0.1750; -3.0000 1.2500 0.1500 0; 2.0000 2.0000 0 0; 4.0000 0 0 0]
% chebyshevPolynomia(3);  % [4 0 -3 0]
% chebyshevPolynomiaZeros(4);  % [-0.9239 -0.3827 0.3827 0.9239]

% exercises
% exercise6_1();  % exercise 6.1
exercise6_4(linspace(2, 2.4, 5), sqrt(linspace(2, 2.4, 5)));  % [1.414213562373095 0.349241122458488 -0.041104472283004 0.009243006108162 -0.002486810899427], [1.414213562373095 0.349241122458488 -0.041104472283004 0.009243006108147 -0.002486810899327]
% exercise6_5();  % exercise 6.5
% exercise6_6();  % exercise 6.6
% exercise6_7();  % exercise 6.7
% exercise6_8();  % exercise 6.8
% exercise6_9();  % exercise 6.9
% exercise6_10(); % exercise 6.10

%% chapter 7
% algorithms
trapezoidalRule(@(x) x^2, 0, 4, 100);  % 21.33
simpson(@(x) x^3, 0, 4, 100);  % 64
romberg(@(x) x^4, 0, 4, 100, 5);  % 204.8

% exercises
% exercise7_1();  % see image
% exercise7_2();  % see image
% exercise7_3(); % exercise 7.3
% exercise7_4(); % exercise 7.4
% exercise7_5(); % exercise 7.5

%% chapter 8
% algorithms
% exercises