clear;
clc;
%% 
% In the baseline scenario: $\pi_s = 4.05 \times 10^{-7}$, $\eta = 10$, $\phi_1 
% = 0.2$

caseid  = 1;
parameters;
ups2    = 1 - ups1;
phi2    = (1 - phi1*ups1)/(1 - ups1);
%% 
% Call Dynare:

dynare multisector noclearall;
%% 
% Plot perfect foresight solutions:

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