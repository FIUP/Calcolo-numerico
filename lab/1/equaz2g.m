%% Quadratic equation solver
% Reads input and solves associated quadratic equation

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


%% Read input
a = input('x² coefficient (~= 0)?    ');
b = input('x coefficient?    ');
c = input('known term?    -');

if a == 0 || b == 0 || c == 0
    error('At least one of the coefficients is null.');
else
    a, b, c  % show input
    delta = b ^ 2 - 4 * a * c;  % calculate D
    if delta < 0
        error('Delta < 0')
    else
        if delta == 0
            x1 = -b / (2 * a);  % 2 equals solutions
            x2 = x1;
        else
            x1 = (-b - sqrt(delta)) / (2 * a);  % standard 2-deg equation
            x2 = (-b + sqrt(delta)) / (2 * a);
        end
        
        disp('Solution:')
        x1, x2
    end
end
