function [x] = moon_position(t)
d = 400.5*10^6; %eath moon distance 
T = 27.3*24*3600; % period of rotation of Moon 
theta = -61*2*pi/360; %Initial angle of moon (converted to radians)
x(1,:) = d*cos(2*pi/T.*t+theta); x(2,:) = d*sin(2*pi/T.*t+theta); %2D polar coordinate conversion with 
                                                                    % angular frequency 2*pi/T.*t and phase theta










