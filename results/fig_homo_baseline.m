clear;
clc;

var = {'I', 'S', 'R', 'D', 'C', 'N'};

filenames = {   'eta_10_phi_20_ups_50.mat', 'eta_10_phi_100_ups_50.mat'};

case_names = { 'Baseline', '$\phi = 1$'};

patterns = {'-', ':'};

colors = [0 0 1;
          0 0 0];

ylabels = { '\% of initial population', ...
            '\% of initial population', ...
            '\% of initial population', ...
            '\% of initial population', ...
            '\% dev.~from SS', ...
            '\% dev.~from SS'};
        
EndT = 150;

set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');

figure('Name', 'Baseline case and ');

for n = 1:numel(var)

    for f = 1:numel(filenames)
        load(filenames{f});
        ind.(var{n}) = strmatch(var{n}, M_.endo_names, 'exact');    
        x = 0:(EndT-1);
        y = oo_.endo_simul(ind.(var{n}),2:(EndT+1));
        subplot(2,3,n)
        hold on
        plot(x, 100*y, 'linestyle', patterns{f}, 'color', colors(f,:), 'LineWidth',2)
        title(['{\bf ' strtrim(M_.endo_names_long(ind.(var{n}), :)) '}'], 'Interpreter','latex')
        xlim([0 EndT]);
        ylabel(ylabels{n}, 'Interpreter','latex');
        if f == numel(filenames) && n == 1
            ylim([0 2]);
            legend(case_names, 'Location', 'NorthEast');
            legend boxoff;
        end
    end
    if n >3
        xlabel('Weeks', 'interpreter', 'latex');
    end
end

    