Hmn=1j;            % Hz Amplitude

% Initialize arrays
Hz = zeros(length(x),length(y));
Hx = zeros(length(x),length(y));
Hy = zeros(length(x),length(y));
Ex = zeros(length(x),length(y));
Ey = zeros(length(x),length(y));

for ii=1:length(x);
    for jj=1:length(y);
        Hz(ii,jj)=Hmn*cos(m*pi*x(ii)/a)*cos(n*pi*y(jj)/b);
        Hx(ii,jj)=(gamma*m*pi)/(kc^2*a)*Hmn*sin(m*pi*x(ii)/a)*cos(n*pi*y(jj)/b);
        Hy(ii,jj)=(gamma*n*pi)/(kc^2*b)*Hmn*cos(m*pi*x(ii)/a)*sin(n*pi*y(jj)/b);
        Ex(ii,jj)=(j*w*mu*n*pi)/(kc^2*b)*Hmn*cos(m*pi*x(ii)/a)*sin(n*pi*y(jj)/b); 
        Ey(ii,jj)=(-1j*w*mu*m*pi)/(kc^2*a)*Hmn*sin(m*pi*x(ii)/a)*cos(n*pi*y(jj)/b); 
    end;
end;