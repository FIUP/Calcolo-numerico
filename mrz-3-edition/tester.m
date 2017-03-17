%{
 % Copyright 2017 Stefano Fogarollo
 %
 % Licensed under the Apache License, Version 2.0 (the "License");
 % you may not use this file except in compliance with the License.
 % You may obtain a copy of the License at
 %
 % http://www.apache.org/licenses/LICENSE-2.0
 %
 % Unless required by applicable law or agreed to in writing, software
 % distributed under thefromBase10Conversion License is distributed on an "AS IS" BASIS,
 % WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 % See the License for the specific language governing permissions and
 % limitations under the License.
%}


% to run scripts in this repository go to Home > Environment > Set Path >
% Add with subfolders > Select this folder

% some examples of usage


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
    % [
    % 2,2.22044604925031e-16,2.22044604925031e-16,16;
    % 3,1.11022302462516e-16,1.11022302462516e-16,16
    % ]
hornerVSAll([10^18, 10 ^ 1, 10^-9], 10^23);  % 9.999999999999999e+63, 9.999999999999999e+63
parabolaSolverSmartVersion(1, 4, 1);  % -3.7321, -0.2679
% parabolaSolverTester(10 ^(-3), 0.8, -6 * 10 ^ (-5), -1 * 10 ^ (-5));  % like picture 2.2 in book
parabolaSolverComplexVersion(9, 1, 1);  % -0.0556 - 0.3287i, -0.0556 + 0.3287i

%% chapter 3
% algorithms
% fixedPoint();
% newton();
% multipleRootsNewton();
% halley();
% convergenceEvaluation();
% multiplicityEvaluation();
% laguerre();
% bairstow();

% exercises
% whyBisectLikeThis();
% secantVSNewton();
% newtonPlotter();
% steffensenPlotter();
% bisectionPlotter();
% exercise3_6();
% exercise3_7();
% exercise3_8();

%% chapter 4
% algorithms
% exercises

%% chapter 5
% algorithms
% exercises

%% chapter 6
% algorithms
% exercises

%% chapter 7
% algorithms
% exercises

%% chapter 8
% algorithms
% exercises