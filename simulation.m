clear;
clc;
%% Parameter values
% In the baseline scenario: $\pi_s = 4.05 \times 10^{-7}$, $\eta = 10$, $\phi_1 = 0.2$
% phi1 = 1 corresponds to a homogeneous-sector economy

caseid  = 1;
parameters;

% phi1    = 1;

ups2    = 1 - ups1;
phi2    = (1 - phi1*ups1)/(1 - ups1);

%% Retrieve initial values
if phi1 == 1
    load('init/init_constant_phi.mat');
    save('init.mat', 'oo_');
else
    load('init/init_baseline.mat');
    save('init.mat', 'oo_');
end

%% Call Dynare
% version 4.6.1

dynare multisector noclearall;

%% Plot perfect foresight solutions:

variables = [I S R D C N];
titles = {  'Infected',... 
            'Susceptible',...
            'Recovered',...
            'Deceased',...
            'Agg. consumption',...
            'Agg. labor'};
EndT = 150;
figure;
for n = 1:6
    subplot(2,3,n);
    plot(0:(0+EndT), 100*variables(2:(2+EndT),n), 'linewidth', 2);
    title(titles{n});
end