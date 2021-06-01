clear;
%% Initial setup

DOSEARCH    = 0; % 1 if grid search is to be performed. Set the grid in the section below
DOSUMMER    = 1; % 1 if seasonality is to be included.

DOPLOT      = 1-DOSEARCH;

clc;

% Sweden data
Sweden_WHO; % Swedish data on COVID deaths. Source: WHO.
Population = 10327589; % Swedish population in 2019.

if DOSUMMER
    psmpl = length(s1_W.Data); % Sample periods from data
else
    psmpl = length(s1_W.Data);
end
% psmpl = 32;

% Simulated periods
p       = 100;

%% Initializing Dynare
dynare kuxmain noclearall;

% Setting up perfect foresight simulations
options_.periods            = p;
options_.stack_solve_algo   = 0;
options_.noprint            = 1;
warning off;
perfect_foresight_setup;

%% Grid search
% Setting up grid for parameters
if DOSEARCH % Set the search grid below
    
    starttime       = clock;
    
    prange.kappa  	= 14;
    prange.alpha  	= [2e-3 5e-3];
    prange.phi1     = 1; %.1:.1:1;

    % Setting up grid for shocks
    srange.pi_s     = 0e-6:2e-8:5e-6;
    srange.I0     	= [1 5 10 50 100];

    if DOSUMMER
        srange.winter   = -.05:-.05:-.95; % Seasonal effects
    else
        srange.winter   = 0;
    end
    
else % Set parameters to single values to obtain the simulated paths
    
    starttime       = clock;
    
    prange.kappa  	= 14;
    prange.alpha  	= 0.002;
    prange.phi1     = 1;

    % Setting up grid for shocks
    srange.pi_s     = 1.46e-6;
    srange.I0     	= 10;

    if DOSUMMER
        srange.winter   = -0.7; % Seasonal effects
    else
        srange.winter   = 0;
    end
    
end

pfields         = fieldnames(prange);
sfields         = fieldnames(srange);

% Construct vectors of parameters and shocks
pvec            = combvec(  prange.kappa,... 
                            prange.alpha,... 
                            prange.phi1);
Lp              = size(pvec,2); % Number of vectors to loop through

svec            = combvec(  srange.pi_s,...
                            srange.I0,... 
                            srange.winter);
Ls              = size(svec,2);

RMSE            = 1e10.*ones(Ls, Lp);

esttime         = 0;
elptime         = 0;

perfect_foresight_setup;

oo_.endo_simul = csvread('initbaseline.csv');
%% Solving the models
for j = 1:Lp
    for x = 1:Ls
        
        % Change shock sizes
        oo_.exo_simul(2:(p+2),1)    = svec(1,x);
        oo_.exo_simul(2,2)          = svec(2,x);
        oo_.exo_simul(10:36,3)      = svec(3,x); % Oct - Dec season effects (36:49)
        oo_.exo_simul(2:(p+1),4)  	= 0; % 0 - economics switched on

    
        clc;
        for jparam = 1:length(pfields)
            set_param_value(pfields{jparam}, pvec(jparam,j));
        end
        
        Tcurrent = table(   [fliplr(pvec(:,j)')';svec(:,x)],...
                            'VariableNames', {'Current value'},...
                            'RowNames', [fliplr(pfields')'; sfields]);
        disp(Tcurrent);
        progress        = (x + (j-1)*Ls)/(Lp*Ls);
        
        if rem((x + (j-1)*Ls),length(srange.pi_s)) == 0
            elptime         = seconds(etime(clock,starttime));
            esttime         = seconds(etime(clock,starttime)/progress);
            esttime.Format  = 'hh:mm:ss';
            elptime.Format  = 'hh:mm:ss';
        end
        
        disp('Progress:');
        disp([num2str(100*progress) '%']);
        disp('Time elapsed:');
        disp(elptime);
        disp('Remaining time:');
        disp(esttime*(1-progress));

        %%%%%%%%%%%%%%%%%%%%%%%%%
        perfect_foresight_solver;
        %%%%%%%%%%%%%%%%%%%%%%%%%

        realized    = 1e5*s1_W.data(1:psmpl)./Population;  % per 100,000 people
        predicted   = dD(2:(psmpl+1));          

        RMSE(x,j)   = sqrt(mean((predicted - realized).^2));
    end
end

[M,Idx]     = min(RMSE(:));
[row, col]  = ind2sub(size(RMSE), Idx);
opt         = [fliplr(pvec(:,col)')';svec(:,row);RMSE(row,col)]';

OptTable 	= table(opt', 'VariableNames', {'Optimal value'}, ...
    'RowNames',{'$\phi_1$','$\alpha$','$\kappa$','$\pi_s$','$I_0$','winter','RMSE'});
disp(OptTable);

save('rmseresults.mat', 'DOSEARCH', 'DOSUMMER', 'RMSE', 'pvec', 'svec', 'prange', 'srange');

clean_current_folder;
%% Plot
if DOPLOT
%     Comparison with data
    Sweden_WHO;
    s1_W.Data = 100000*s1_W.Data./10327589;
    s2_W = s1_W;
    s2_W.Data = dD(2:(length(s1_W.Data)+1));
    
    dateseq = datenum(s1_W.TimeInfo.StartDate):7:(datenum(s1_W.TimeInfo.StartDate)+7*(length(s1_W.Data)-1));
    
    figure;
    plot(dateseq, [s1_W.Data s2_W.Data], 'linewidth', 2);
    hold on;
    plot(dateseq, s2_W.Data, 'linewidth', 2);
    ylabel('Death per 100,000 people');
    title([ '$\phi_1 = $' num2str(phi1) ', '...
            '$\alpha = $' num2str(alpha) ', '...
            '$\kappa = $' num2str(kappa) ', '...
            '$I_0 = $' num2str(svec(2,x)) ', '...
            '$summer = $' num2str(svec(3,x)) ', '...
            'RMSE = ' num2str(RMSE) ', '...
            '$R_0 = $' num2str(svec(1,x).*A.^2/theta./(7/kappa))], 'interpreter', 'latex');
    legend('Actual', 'Simulated', 'location', 'NorthEast');
    datetick('x','mmm','keeplimits');
    
%     Population dynamics and macroeconomics
    varmat = [I./pop S./pop R./pop D./pop C N]*100;
    titles = {'Infected', 'Susceptible', 'Recovered', 'Deceased', 'Consumption', 'Labor'};
    ylabels = { 'Percent of initial population',...
                'Percent of initial population',...
                'Percent of initial population',...
                'Percent of initial population',...
                'Percentage change from SS',...
                'Percentage change from SS'};
    figure;
    for i = 1:size(varmat,2)
        subplot(2,3,i);
        plot(dateseq, varmat(2:(psmpl+1),i), 'linewidth', 2);
        datetick('x','mmm','keeplimits');
        title(titles{i});
        ylabel(ylabels{i});
    end
    
    figure;
    plot(dateseq, [c1_dev(2:(psmpl+1)) c2_dev(2:(psmpl+1))], 'linewidth', 2);
    datetick('x','mmm','keeplimits');
    title('Sectoral reallocation');
    ylabel('Percentage deviation from SS');
    legend('Low-infection sector', 'High-infection sector', 'location', 'southwest');
end