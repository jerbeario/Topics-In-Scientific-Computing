function [dydt] = spaceship_system(t, y)

xm = moon_position(t); %calculates the position of the moon at time t
a = spaceship_acceleration(xm, y(1:2)); % calculates the acceleration of the spacecraft based on
                                            % its current inputed position and the position of the moon
dydt = [y(3); y(4); a+thrust(t, y(3:4))];   %returns the derivative of the position and velocity states which is the velocity and acceleration state for x and y cooridnates
end


