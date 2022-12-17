% TEST_MOON_POSITION
% If you have created a correct function 'moon_position',
% executing this script will plot one revolution of
% the moon around the earth (red circle).
npt = 360;
one_month = 27.321582*24*3600;
xm0=moon_position(0);
assert(size(xm0,1)==2 && size(xm0,2)==1) % moon_position must return a 2x1 vector
ts=[0,24*60*60,27.3*24*60*60];
expected_xms=[[1.941662529086580e8;-3.502851927093280e8],[2.689558041986162e8;-2.967541497399415e8],[1.941662529086581e8;-3.502851927093279e8]];
err=1e7;
for i=1:length(ts)
    fprintf('Test %d ...\n',i);
    xm=moon_position(ts(i));
    if norm(xm-expected_xms(:,i))<err
      disp('passed')
    else
      disp('failed')
    end
end

plot_moon_orbit;
