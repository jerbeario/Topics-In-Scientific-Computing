%initial poistion and veolcity 
%x0 = [2*10^8;-3.4*10^8];
%v0 =[5*10^2; 9*10^2];

%earth orbit 
x0 = [-20.0*10^6;0];
v0 =[0; -6*10^3];

%moon orbit 
%x0 = [2*10^8;-3.4*10^8];
%v0 =[5*10^2; 9*10^2];


t0 = 0; 
tf = 235873;
time = t0:100:tf;
                                 
%other solvers 
%[t,y] = ode45(@spaceship_system, [0,tf], [x0;v0]);
%[t1, y1] = kutta(@spaceship_system, [0,tf], [x0;v0]);
%[t2, y2] = ode45(@spaceship_system, [0,tf], [x0;v0]);

[t,y] = ode45(@spaceship_system, t, [x0;v0]);
moon_pos = moon_position(t);

%plotting position in 2d
plot(y(:, 1),y( :, 2), 'Color', 'blue'); hold on;

plot(0, 0, 'x')
title("Posiiton in space of spaceshift")

[xmin, ymin] = circle(0,0, 8*10^6);
[xmax, ymax] = circle(0,0, 20*10^6);
%plot(moon_pos(1, :), moon_pos(2, :))
plot(xmin, ymin, '--k', xmax, ymax, '--k')
legend('Spaceship', 'Earth', 'Moon Orbit', 'Orbit Bounds')
hold off;



%plot(t, dist(y(:, 3),y(:, 4)), 'Color', 'blue')
%title("Speed of spaceshift")

