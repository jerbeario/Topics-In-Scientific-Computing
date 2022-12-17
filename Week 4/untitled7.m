%% A simple test file to see if the spaceship_system function works
earth_mass = 5.97e24;
gravitational_constant = 6.67e-11;
y = [15e6; % Initial x-position
      1e6;  % Initial y-position
      2e3;  % Initial velocity in x-direction
      4e3]; % Initial velocity in y-direction
t = 3600; % Intial time
dy_dt = spaceship_system(t,y)
expected_dy_dt = [2e3;4e3;-1.758816162927907;-0.117283360315119]
error = norm(dy_dt-expected_dy_dt)

assert(error<1e-14)