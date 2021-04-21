Copyright (c) 2021, 9mpd
All rights reserved.

This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree.

%% Soving system of non linear equations in three variables,
%% using N-R method.
%% And, also calculating the time of computation.

% Clear Workspace for good execution of the progranm.
clear
% Clear Command Window for the same reason.
clc     

% Symbolic variables.
syms x y z

% Title of the program.
disp("System of non-linear equations in three variables.");

% Input for 1st function in the form of string. 
f1=input("\nEnter the 1st function : ",'s');
% Convert string into 1st function .
f = str2func(['@(x,y,z)',f1]);       
% Input for 2nd function in the form of string. 
g1=input("Enter the 2nd function : ",'s');
% Convert string into 2nd function.
g = str2func(['@(x,y,z)',g1]);
% Input for 3rd function in the form of string. 
h1=input("Enter the 3rd function : ",'s');
% Convert string into 3rd function.
h = str2func(['@(x,y,z)',h1]);

% A matrix to store partial derivatives of the functions.
JDiff = [diff(f,x) diff(f,y) diff(f,z); ...
         diff(g,x) diff(g,y) diff(g,z); ...
         diff(h,x) diff(h,y) diff(h,z)]; 

% Intial approximation vector.
I = input("\nEnter the initial approximation, a column vector. ");

% Inverse of partial differentiations matrix.
J = inv(JDiff);
% Jcobian matrix initially with all values zero.
JK = zeros(3,3);
% Assignment of values in the Jacobian matrix.
for i=1:3
    for j=1:3
        JK(i,j) = subs(J(i,j), {x,y,z}, {I(1),I(2),I(3)});
    end
end

% A column vector storing values of functions at intial appx.vector.
fval = [subs(f, {x,y,z}, {I(1),I(2),I(3)}); ...
        subs(g, {x,y,z}, {I(1),I(2),I(3)}); ...
        subs(h, {x,y,z}, {I(1),I(2),I(3)})];

% Number of iterations to be performed.
N = input("\nEnter the number of iterations you want to perform.");
fprintf('\n');

% Timer to calculate the time of computation.
tStart = tic;

% A loop to perform iterations to get the solution.
for ii=1:N
    % Calculation of next approximation vector.
    IK = I - JK*fval;
    % Updated approximation vector.
    I = IK;
    
    % Jacobian matrix with updated approximation vector. 
    for i=1:3
        for j =1:3
            JK(i,j) = subs(J(i,j), {x,y,z}, {I(1),I(2),I(3)});
        end
    end
    
    % Functions value at the updated approximation vector. 
    fval = [subs(f, {x,y,z}, {I(1),I(2),I(3)}); ...
            subs(g, {x,y,z}, {I(1),I(2),I(3)}); ...
            subs(h, {x,y,z}, {I(1),I(2),I(3)})];
end
% Stop timer.
tEnd = toc(tStart);

% Solution.
fprintf('\nSolution of given system is : ');
double(IK)
% Time taken in the computation process.
fprintf("\nTotal time taken in this computation =%0.4f sec",tEnd)

