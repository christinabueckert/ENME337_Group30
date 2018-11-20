%{
% ENME 337, Final Project 
% Due Dec 3, 2018 WOOOOOO WOOOOO #2
%}
close all; clear; clc;

p = 1.23;
a_c = 0.2; 
cut_in = 3;
cut_off = 25; 

load('DataFiles/radius.dat'); load('DataFiles/omega.dat'); load('DataFiles/twist.dat');
load('DataFiles/chord.dat'); load('DataFiles/DU21.dat'); load('DataFiles/DU30.dat');
load('DataFiles/DU35.dat'); load('DataFiles/DU40.dat'); load('DataFiles/NACA64.dat');
%Sets of functions wrt r
r = radius'   ; % radial positions along the blade r 
chord = chord'; % chord of the blade at different radial positions
twist = twist'; % twist angle of the blade in degrees at different radial positions 

w = omega';    % rotational speed for different wind speeds
B = 3;
%just plot this for the hell of it (you can get rid of this later)
plot(r,chord,r,twist);

%% Computation of Power Production
% (1)  -  Initialize a? and a.
a = 100;
a_p = 100;

% (2)  -  Compute the flow angle.
tan_psi = @(A, Ap, V0, Omega, R) ((1-A)*V0)/((1+Ap)*Omega*R); %adds function for tan(psi)
psi = @(A, Ap, V0, Omega, R) arctan(tan_psi(A, Ap, V0, Omega, R)); %inverse tans to find psi

% (3)  -  Compute local angle of attack
alpha = @(Psi,Theta) Psi - Theta;

% (4)  -  Determine C1(alpha) and C2(alpha) according to the given airfoil profile

% (5)  -  Compute normalized force Cn and Ct
Cn = @(Cl,Cd,Psi) (Cl*cos(Psi))+(Cd*sin(Psi));
Ct = @(Cl,Cd,Psi) (Cl*sin(Psi))-(Cd*cos(Psi));

% (6)  -  Calculate a' and a
% c = @(R) local chord at position r => I think you need to do the
% interpolation but who knows
% sigma = @(R,B)  


% (7)  -  Apply the following correction (called Glauert correction) for
                %large values of a
                
% (8)  -  If a? and a has changed more than a certain tolerance (use 1e-6), go to step (2) or
                %else proceed to the next step

        
        


