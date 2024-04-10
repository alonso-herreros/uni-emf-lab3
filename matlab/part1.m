%% Init
clc; close all; clear all;
set(groot,'defaulttextinterpreter','latex');
set(groot, 'defaultLegendInterpreter', 'latex');

%% Set variables

% Constants
c = 3e8; % speed of light in m/s
mu_0 = 120*pi;
eps_r = 1;

fstep = 0.1e9; % 0.1 GHz
f = 0.1e9:fstep:20e9; % 0.1 GHz to 20 GHz
omega = 2*pi*f;

a = 2e-2; % 2 cm
b = 1.5e-2; % 1.5 cm
% tandelta = 0;


%% Define formulas as function

gamma_ = @(m, n) sqrt(-(omega/c).^2 + (m*pi/a).^2 + (n*pi/b).^2);
alpha_ = @(m, n) real(gamma_(m,n));
beta_ = @(m, n) imag(gamma_(m,n));
Zm_ = @(m, n) (1j*omega*mu_0)./gamma_(m,n);


%% 1) Represent the Brillouin diagram

% Mode 10
figure(1);
title('Mode 10');

subplot(2, 1, 1, 'replace');
gamma_10 = gamma_(1,0);
plot(real(gamma_10), f/1e9, 'r', ...
     imag(gamma_10), f/1e9, 'g');
xlabel('$\gamma = \alpha + j \beta$ ($m^{-1}$)'); ylabel('f (GHz)');

%% 2) Represent the mode impedance against frequency
subplot(2, 1, 2, 'replace');
Zm_10 = Zm_(1,0);
plot(f/1e9, real(Zm_10), 'r', ...
     f/1e9, imag(Zm_10), 'g');
xlabel('f (GHz)'); ylabel('$\gamma$ ($m^{-1}$)');
axis([0 max(f/1e9) 0 2000]);

%% Other modes
% Mode 01
figure(2);
title('Mode 01');

subplot(2, 1, 1, 'replace');
gamma_01 = gamma_(0,1);
plot(real(gamma_01), f/1e9, 'r', ...
     imag(gamma_01), f/1e9, 'g');
xlabel('$\gamma = \alpha + j \beta$ ($m^{-1}$)'); ylabel('f (GHz)');

subplot(2, 1, 2, 'replace');
Zm_01 = Zm_(0,1);
plot(f/1e9, real(Zm_01), 'r', ...
     f/1e9, imag(Zm_01), 'g');
xlabel('f (GHz)'); ylabel('$\gamma$ ($m^{-1}$)');
axis([0 max(f/1e9) 0 2000]);


% Mode 11
figure(3);
title('Mode 11');

subplot(2, 1, 1, 'replace');
gamma_11 = gamma_(1,1);
plot(real(gamma_11), f/1e9, 'r', ...
     imag(gamma_11), f/1e9, 'g');
xlabel('$\gamma = \alpha + j \beta$ ($m^{-1}$)'); ylabel('f (GHz)');

subplot(2, 1, 2, 'replace');
Zm_11 = Zm_(1,1);
plot(f/1e9, real(Zm_11), 'r', ...
     f/1e9, imag(Zm_11), 'g');
xlabel('f (GHz)'); ylabel('$\gamma$ ($m^{-1}$)');
axis([0 max(f/1e9) 0 2000]);


% Mode 20
figure(4);
title('Mode 20');

subplot(2, 1, 1, 'replace');
gamma_20 = gamma_(2,0);
plot(real(gamma_20), f/1e9, 'r', ...
     imag(gamma_20), f/1e9, 'g');
xlabel('$\gamma = \alpha + j \beta$ ($m^{-1}$)'); ylabel('f (GHz)');

subplot(2, 1, 2, 'replace');
Zm_20 = Zm_(2,0);
plot(f/1e9, real(Zm_20), 'r', ...
     f/1e9, imag(Zm_20), 'g');
xlabel('f (GHz)'); ylabel('$\gamma$ ($m^{-1}$)');
axis([0 max(f/1e9) 0 2000]);


%% 3) Repeat the fundamental mode plots with tandelta = 0.01

tandelta = 0.01;
gamma_ = @(m, n) sqrt(-(omega/c*eps_r).^2 * (1 - 1j*tandelta) + (m*pi/a).^2 + (n*pi/b).^2);

figure(5);
title('Mode 10');

subplot(2, 1, 1, 'replace');
gamma_10 = gamma_(1,0);
plot(real(gamma_10), f/1e9, 'r', ...
     imag(gamma_10), f/1e9, 'g');
xlabel('$\gamma = \alpha + j \beta$ ($m^{-1}$)'); ylabel('f (GHz)');

subplot(2, 1, 2, 'replace');
Zm_10 = Zm_(1,0);
plot(f/1e9, real(Zm_10), 'r', ...
     f/1e9, imag(Zm_10), 'g');
xlabel('f (GHz)'); ylabel('$\gamma$ ($m^{-1}$)');
axis([0 max(f/1e9) 0 2000]);
