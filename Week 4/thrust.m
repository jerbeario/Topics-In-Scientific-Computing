function v = thrust(t, vc)

theta = angle(vc(1)+1i*vc(2));

v=[0; 0];
%if t>1000000 && abs(vc(1)+1i*vc(2))<5*10^3
%    v(1)=vc(1)/abs(vc(1))*10;
%    v(2)=vc(2)/abs(vc(2))*10;
%end
%
%if t>2000000 && t<2001000
%    v(1)=-1;
%    v(2)=-1;
%end
%%earth orbit 
%x0 = [-15.0*10^6;0];
%v0 =[0; -5*10^3];

%moon orbit 
%x0 = [2*10^8;-3.4*10^8];
%v0 =[5*10^2; 9*10^2];