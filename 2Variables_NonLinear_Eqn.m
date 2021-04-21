Copyright (c) 2021, 9mpd
All rights reserved.

This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree.

%% Soving system of non linear equations in two variables,
%% using N-R method.
%% And, also calculating the time of computation.

% Clear Workspace for good execution of the progranm.
clear
% Clear Command Window for the same reason.
clc     

% Symbolic variables.
syms x y   

% Title of the program.
disp("System of non-linear equations in two variables.");

% Input for 1st function in the form of string. 
f1=input("\nEnter the 1st function : ",'s');
% Convert string into 1st function .
f = str2func(['@(x,y)',f1]);       
% Input for 2nd function in the form of string. 
g1=input("Enter the 2nd function : ",'s');
% Convert string into 2nd function.
g = str2func(['@(x,y)',g1]);

% A matrix to store partial derivatives of the functions.
JDiff = [diff(f,x) diff(f,y); ...
         diff(g,x) diff(g,y)]; 

% Intial approximation vector.
I = input("\nEnter the initial approximation, a column vector. ");

% Inverse of partial differentiations matrix.
J = inv(JDiff);
% Jcobian matrix initially with all values zero.
JK = zeros(2,2);
% Assignment of values in the Jacobian matrix.
for i=1:2
    for j=1:2
        JK(i,j) = subs(J(i,j), {x,y}, {I(1),I(2)});
    end
end

% A column vector storing values of functions at intial appx.vector.
fval = [subs(f, {x,y}, {I(1),I(2)}); ...
        subs(g, {x,y}, {I(1),I(2)})];

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
    for i=1:2
        for j =1:2
            JK(i,j) = subs(J(i,j), {x,y}, {I(1),I(2)});
        end
    end
    
    % Functions value at the updated approximation vector. 
    fval = [subs(f, {x,y}, {I(1),I(2)}); ...
           subs(g, {x,y}, {I(1),I(2)})];
end
% Stop timer.
tEnd = toc(tStart);

% Solution.
fprintf('\nSolution of given system is : ');
double(IK)
% Time taken in the computation process.
fprintf("\nTotal time taken in this computation =%0.4f sec",tEnd)

% The figure command for plots. 
figure_handle = figure;
% Title of plot.
title("\color{red}Sloution of system of nonlinear equations")
% Vectors to create meshgrid.
x = -2:0.1:2;                                                 
y = -2:0.1:2;                
% Meshgrid.
[x,y] = meshgrid(x,y); 
% Plot corresponding to 1st functoin.
surf(x,y,f(x,y));
% Hold on to plot other plots on the same figure.
hold on;
% Plot corresponding to 2nd functoin.
surf(x,y,g(x,y));
% Label axes.
xlabel('X -->');
ylabel('Y -->');
zlabel('Z -->');
% Hold off so that other plots do not get plotted on this figure.
rotate3d(figure_handle);
hold off;
