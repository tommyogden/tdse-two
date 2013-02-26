% tdse_two_pulse_test_b
% Tests:    2pi pulse, detuning
%
% Author:   T P Ogden <t.p.ogden@durham.ac.uk>

%% Parameters

clear;

p.Omega_21 = 10; % Rabi frequency [2pi MHz]
p.Delta_21 = 5; % Detuning [2pi MHz]

pulse_in_pi = 4; % [] e.g. 1 for pi-pulse, 1/2 for pi/2-pulse.
p.pulse_duration = pulse_in_pi*pi/p.Omega_21; % [�s]

p.init_pop = [1;0]; % initial populations of the states

p.duration = 2*p.pulse_duration; % [�s] duration to be solved

%% Solve for pulse
tic;
[t,phi] = tdse_two_pulse(p);
toc;

%% Plotting

fig_1 = figure; plot(t/pi,phi.*conj(phi)); axis([t(1)/pi t(end)/pi -0.1 1.1]);
xlabel('t (\pi �s)'), ylabel('|c|^2'), title(['Population of states |1\rangle, |2\rangle vs time'])

csvwrite('csv/tdse_pulse_test_b_pop.csv',[t/pi phi.*conj(phi)]);