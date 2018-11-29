%{
% ENME 337, Final Project 
% Due Dec 3, 2018 WOOOOOO WOOOOO #2
% given city: calgary, hub height: 85m, air foil: DU40
%}
clc;clear;close all;

  %PRELIMINARY DATA
HH=85; %Hub height given in metres 
cvn=1000/3600; %conversion factor to multiply by to convert from km/h to m/s
  %WIND SPEED DATA
fileData(cvn); %initializes function the sets up all the wind data
% sets up each months vector of wind speed
load 'WindSpeeds/Jan_WS.dat';load 'WindSpeeds/Feb_WS.dat';load 'WindSpeeds/Mar_WS.dat';
load 'WindSpeeds/Apr_WS.dat';load 'WindSpeeds/May_WS.dat';load 'WindSpeeds/June_WS.dat';
load 'WindSpeeds/July_WS.dat';load 'WindSpeeds/Aug_WS.dat';load 'WindSpeeds/Sept_WS.dat';
load 'WindSpeeds/Oct_WS.dat';load 'WindSpeeds/Nov_WS.dat';load 'WindSpeeds/Dec_WS.dat';
% Sets up each month's vector of wind direction
load 'WindDirection/Jan_WD.dat';load 'WindDirection/Feb_WD.dat';load 'WindDirection/Mar_WD.dat';
load 'WindDirection/Apr_WD.dat';load 'WindDirection/May_WD.dat';load 'WindDirection/June_WD.dat';
load 'WindDirection/July_WD.dat';load 'WindDirection/Aug_WD.dat';load 'WindDirection/Sept_WD.dat';
load 'WindDirection/Oct_WD.dat';load 'WindDirection/Nov_WD.dat';load 'WindDirection/Dec_WD.dat';

  %WIND SPEED AT HUB HEIGHT// Power Law
PwrLaw=@(h,v) round(v.*(h/15).^(1/7)); %defines power law function
%sets wind speed value to that at our hub height of 85m; 
JanWS = PwrLaw(HH,Jan_WS); FebWS = PwrLaw(HH,Feb_WS); MarWS = PwrLaw(HH,Mar_WS);
AprWS = PwrLaw(HH,Apr_WS); MayWS = PwrLaw(HH,May_WS); JuneWS = PwrLaw(HH,June_WS);
JulyWS = PwrLaw(HH,July_WS); AugWS = PwrLaw(HH,Aug_WS); SeptWS = PwrLaw(HH,Sept_WS); 
OctWS = PwrLaw(HH,Oct_WS); NovWS = PwrLaw(HH,Nov_WS); DecWS = PwrLaw(HH,Dec_WS);

p = 1.23;
a_c = 0.2; 
cut_in = 3;
cut_off = 25; 

load('DataFiles/radius.dat'); load('DataFiles/omega.dat'); load('DataFiles/twist.dat');
load('DataFiles/chord.dat'); load('DataFiles/DU21.dat'); load('DataFiles/DU30.dat');
load('DataFiles/DU35.dat'); load('DataFiles/DU40.dat'); load('DataFiles/NACA64.dat');
%Sets of functions wrt r
r = radius   ; % radial positions along the blade r 
c = chord; % chord of the blade at different radial positions
twist = (pi/180).*twist; % twist angle of the blade in degrees at different radial positions 

w = (2*pi/60).*omega;    % rotational speed for different wind speeds
B = 3;
V0 = 1:1:25;

%% Computation of Power Production
power  = power_calculation(V0,B,w,twist,c,r,p,a_c);

%% Calculates the number of turbines needed

numberOfTurbines = calcNumTurbines(power)

      %%
   %Plots
   %initalizing matricies for windspeeds based on # of days in month and a
%vector containing all data points for wind directions throuought the year
%(USED FOR PLOTS)
  WS31=[JanWS;MarWS;MayWS;JulyWS;AugWS;OctWS;DecWS]; 
  WS30=[AprWS;JuneWS;SeptWS;NovWS];
  WS28=[FebWS];
WD=[Jan_WD,Feb_WD,Mar_WD,Apr_WD,May_WD,June_WD,July_WD,...
    Aug_WD,Sept_WD,Oct_WD,Nov_WD,Dec_WD];
  
WindPlot(WD,WS31,WS30,WS28,chord,twist,r);
   
        
        


