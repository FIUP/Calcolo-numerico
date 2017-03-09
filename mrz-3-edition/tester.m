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
fromBase10Conversion(4, 2);  % should return 100
toBase10HornerConversion([15, 0, 1], 16);  % should return 3841
polynomialEvaluationInPoint([2, 1, 0], 2, 10);  % should return 210 