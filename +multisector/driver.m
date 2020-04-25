%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'multisector';
M_.dynare_version = '4.6.1';
oo_.dynare_version = '4.6.1';
options_.dynare_version = '4.6.1';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('multisector.log');
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'eps'};
M_.exo_names_tex(1) = {'eps'};
M_.exo_names_long(1) = {'eps'};
M_.endo_names = cell(19,1);
M_.endo_names_tex = cell(19,1);
M_.endo_names_long = cell(19,1);
M_.endo_names(1) = {'n'};
M_.endo_names_tex(1) = {'n'};
M_.endo_names_long(1) = {'Labor supply'};
M_.endo_names(2) = {'c'};
M_.endo_names_tex(2) = {'c'};
M_.endo_names_long(2) = {'Agg. consumption'};
M_.endo_names(3) = {'lambda_tau'};
M_.endo_names_tex(3) = {'lambda\_tau'};
M_.endo_names_long(3) = {'Lambda'};
M_.endo_names(4) = {'tau'};
M_.endo_names_tex(4) = {'tau'};
M_.endo_names_long(4) = {'tau'};
M_.endo_names(5) = {'I'};
M_.endo_names_tex(5) = {'I'};
M_.endo_names_long(5) = {'Infected'};
M_.endo_names(6) = {'T'};
M_.endo_names_tex(6) = {'T'};
M_.endo_names_long(6) = {'Newly infected'};
M_.endo_names(7) = {'S'};
M_.endo_names_tex(7) = {'S'};
M_.endo_names_long(7) = {'Susceptible'};
M_.endo_names(8) = {'R'};
M_.endo_names_tex(8) = {'R'};
M_.endo_names_long(8) = {'Recovered'};
M_.endo_names(9) = {'D'};
M_.endo_names_tex(9) = {'D'};
M_.endo_names_long(9) = {'Deceased'};
M_.endo_names(10) = {'C'};
M_.endo_names_tex(10) = {'C'};
M_.endo_names_long(10) = {'Agg. consumption'};
M_.endo_names(11) = {'C_sum'};
M_.endo_names_tex(11) = {'C\_sum'};
M_.endo_names_long(11) = {'Agg. consumption'};
M_.endo_names(12) = {'N'};
M_.endo_names_tex(12) = {'N'};
M_.endo_names_long(12) = {'Agg. labor'};
M_.endo_names(13) = {'Ui'};
M_.endo_names_tex(13) = {'Ui'};
M_.endo_names_long(13) = {'Ui'};
M_.endo_names(14) = {'Us'};
M_.endo_names_tex(14) = {'Us'};
M_.endo_names_long(14) = {'Us'};
M_.endo_names(15) = {'Ur'};
M_.endo_names_tex(15) = {'Ur'};
M_.endo_names_long(15) = {'Ur'};
M_.endo_names(16) = {'c1'};
M_.endo_names_tex(16) = {'c1'};
M_.endo_names_long(16) = {'c1'};
M_.endo_names(17) = {'c1_dev'};
M_.endo_names_tex(17) = {'c1\_dev'};
M_.endo_names_long(17) = {'c1_dev'};
M_.endo_names(18) = {'c2'};
M_.endo_names_tex(18) = {'c2'};
M_.endo_names_long(18) = {'c2'};
M_.endo_names(19) = {'c2_dev'};
M_.endo_names_tex(19) = {'c2\_dev'};
M_.endo_names_long(19) = {'c2_dev'};
M_.endo_partitions = struct();
M_.param_names = cell(12,1);
M_.param_names_tex = cell(12,1);
M_.param_names_long = cell(12,1);
M_.param_names(1) = {'pi_s'};
M_.param_names_tex(1) = {'{\pi_s}'};
M_.param_names_long(1) = {'Probability of becoming infected'};
M_.param_names(2) = {'pi_a'};
M_.param_names_tex(2) = {'{\pi_a}'};
M_.param_names_long(2) = {'Probability of autonomous infection'};
M_.param_names(3) = {'pi_r'};
M_.param_names_tex(3) = {'{\pi_r}'};
M_.param_names_long(3) = {'Probability of recovery'};
M_.param_names(4) = {'pi_d'};
M_.param_names_tex(4) = {'{\pi_d}'};
M_.param_names_long(4) = {'Probability of death'};
M_.param_names(5) = {'eta'};
M_.param_names_tex(5) = {'{\eta}'};
M_.param_names_long(5) = {'Dlasticity of substitution'};
M_.param_names(6) = {'theta'};
M_.param_names_tex(6) = {'{\theta}'};
M_.param_names_long(6) = {'Labor supply parameter'};
M_.param_names(7) = {'A'};
M_.param_names_tex(7) = {'{A}'};
M_.param_names_long(7) = {'Productivity'};
M_.param_names(8) = {'betta'};
M_.param_names_tex(8) = {'{\beta}'};
M_.param_names_long(8) = {'Discount factor'};
M_.param_names(9) = {'phi1'};
M_.param_names_tex(9) = {'{\phi_{1}}'};
M_.param_names_long(9) = {'phi1'};
M_.param_names(10) = {'ups1'};
M_.param_names_tex(10) = {'{\upsilon_{1}}'};
M_.param_names_long(10) = {'ups1'};
M_.param_names(11) = {'phi2'};
M_.param_names_tex(11) = {'{\phi_{2}}'};
M_.param_names_long(11) = {'phi2'};
M_.param_names(12) = {'ups2'};
M_.param_names_tex(12) = {'{\upsilon_{2}}'};
M_.param_names_long(12) = {'ups2'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 19;
M_.param_nbr = 12;
M_.orig_endo_nbr = 19;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.orig_eq_nbr = 19;
M_.eq_nbr = 19;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 6 0;
 0 7 0;
 0 8 0;
 0 9 0;
 1 10 0;
 2 11 0;
 3 12 0;
 4 13 0;
 5 14 0;
 0 15 0;
 0 16 0;
 0 17 0;
 0 18 25;
 0 19 26;
 0 20 27;
 0 21 0;
 0 22 0;
 0 23 0;
 0 24 0;]';
M_.nstatic = 11;
M_.nfwrd   = 3;
M_.npred   = 5;
M_.nboth   = 0;
M_.nsfwrd   = 3;
M_.nspred   = 5;
M_.ndynamic   = 8;
M_.dynamic_tmp_nbr = [9; 3; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , 'FOC sector 1' ;
  2 , 'name' , 'Deviation 1' ;
  3 , 'name' , 'FOC sector 2' ;
  4 , 'name' , 'Deviation 2' ;
  5 , 'name' , 'Budget' ;
  6 , 'name' , 'c' ;
  7 , 'name' , 'tau' ;
  8 , 'name' , 'lambda_tau' ;
  9 , 'name' , 'Ui' ;
  10 , 'name' , 'Ur' ;
  11 , 'name' , 'Us' ;
  12 , 'name' , 'T' ;
  13 , 'name' , 'S' ;
  14 , 'name' , 'I' ;
  15 , 'name' , 'R' ;
  16 , 'name' , 'D' ;
  17 , 'name' , 'C' ;
  18 , 'name' , 'N' ;
  19 , 'name' , 'C_sum' ;
};
M_.mapping.n.eqidx = [1 3 5 11 18 ];
M_.mapping.c.eqidx = [1 3 6 11 17 ];
M_.mapping.lambda_tau.eqidx = [1 3 8 ];
M_.mapping.tau.eqidx = [7 11 12 ];
M_.mapping.I.eqidx = [1 3 7 13 14 15 16 17 18 19 ];
M_.mapping.T.eqidx = [12 14 ];
M_.mapping.S.eqidx = [12 13 17 18 19 ];
M_.mapping.R.eqidx = [15 17 18 19 ];
M_.mapping.D.eqidx = [16 ];
M_.mapping.C.eqidx = [17 ];
M_.mapping.C_sum.eqidx = [19 ];
M_.mapping.N.eqidx = [18 ];
M_.mapping.Ui.eqidx = [8 9 11 ];
M_.mapping.Us.eqidx = [8 11 ];
M_.mapping.Ur.eqidx = [9 10 ];
M_.mapping.c1.eqidx = [1 2 5 6 7 19 ];
M_.mapping.c1_dev.eqidx = [2 ];
M_.mapping.c2.eqidx = [3 4 5 6 7 19 ];
M_.mapping.c2_dev.eqidx = [4 ];
M_.mapping.eps.eqidx = [14 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [5 6 7 8 9 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(19, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(12, 1);
M_.endo_trends = struct('deflator', cell(19, 1), 'log_deflator', cell(19, 1), 'growth_factor', cell(19, 1), 'log_growth_factor', cell(19, 1));
M_.NNZDerivatives = [71; -1; -1; ];
M_.static_tmp_nbr = [9; 3; 0; 0; ];
set_param_value('eta',      eta);
set_param_value('pi_s',     pi_s);
set_param_value('pi_a',     pi_a);
set_param_value('pi_d',     pi_d);
set_param_value('pi_r',     pi_r);
set_param_value('betta',    betta);
set_param_value('A',        A);
set_param_value('theta',    theta);
set_param_value('phi1', phi1);
set_param_value('ups1', ups1);
set_param_value('phi2', phi2);
set_param_value('ups2', ups2);
steady;
%
% SHOCKS instructions
%
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',1:1,'value',0.001) ];
M_.exo_det_length = 0;
options_.periods = 5000;
perfect_foresight_setup;
load('init.mat');
options_.stack_solve_algo = 6;
perfect_foresight_solver;
clean_current_folder;
save('multisector_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('multisector_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('multisector_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('multisector_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('multisector_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('multisector_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('multisector_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off