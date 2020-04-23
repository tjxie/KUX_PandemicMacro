clear;
clc;

caseid  = 1;

parameters;

% phi1    = .2;
% pi_s    = 4.05e-7;
ups2    = 1 - ups1;
phi2    = (1 - phi1*ups1)/(1 - ups1);

dynare multisector noclearall;
% save('init.mat', 'oo_');

EndT = 1000;

figure;

subplot(2,3,1);
plot(0:(0+EndT), 100*I(2:(2+EndT)), 'linewidth', 2);
title('Infected');

subplot(2,3,2);
plot(0:(0+EndT), 100*S(2:(2+EndT)), 'linewidth', 2);
title('Susceptible');

subplot(2,3,3);
plot(0:(0+EndT), 100*R(2:(2+EndT)), 'linewidth', 2);
title('Recovered');

subplot(2,3,4);
plot(0:(0+EndT), 100*D(2:(2+EndT)), 'linewidth', 2);
title('Deceased');

subplot(2,3,5);
plot(0:(0+EndT), 100*C(2:(2+EndT)), 'linewidth', 2);
title('Agg. consumption');

subplot(2,3,6);
plot(0:(0+EndT), 100*N(2:(2+EndT)), 'linewidth', 2);
title('Agg. labor');