function [a] = spaceship_acceleration(xm, xs)
%defining constants
G = 6.673 * 10^(-11); 
me = 5.97 * 10^24;
mm = 7.35 * 10^22;
%calculating accelration based on given formula 
a = -G*(me/norm(xs)^3*xs + mm/norm(xs-xm)^3 *(xs-xm));
end