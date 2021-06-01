%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'kuxmain';
M_.dynare_version = '4.6.4';
oo_.dynare_version = '4.6.4';
options_.dynare_version = '4.6.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('kuxmain.log');
M_.exo_names = cell(4,1);
M_.exo_names_tex = cell(4,1);
M_.exo_names_long = cell(4,1);
M_.exo_names(1) = {'pi_s'};
M_.exo_names_tex(1) = {'pi\_s'};
M_.exo_names_long(1) = {'pi_s'};
M_.exo_names(2) = {'eps'};
M_.exo_names_tex(2) = {'eps'};
M_.exo_names_long(2) = {'eps'};
M_.exo_names(3) = {'step'};
M_.exo_names_tex(3) = {'step'};
M_.exo_names_long(3) = {'step'};
M_.exo_names(4) = {'SIR'};
M_.exo_names_tex(4) = {'SIR'};
M_.exo_names_long(4) = {'SIR'};
M_.endo_names = cell(22,1);
M_.endo_names_tex = cell(22,1);
M_.endo_names_long = cell(22,1);
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
M_.endo_names_long(4) = {'Probability of infection'};
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
M_.endo_names(10) = {'dD'};
M_.endo_names_tex(10) = {'dD'};
M_.endo_names_long(10) = {'Weekly death'};
M_.endo_names(11) = {'C'};
M_.endo_names_tex(11) = {'C'};
M_.endo_names_long(11) = {'Agg. consumption'};
M_.endo_names(12) = {'N'};
M_.endo_names_tex(12) = {'N'};
M_.endo_names_long(12) = {'Agg. labor'};
M_.endo_names(13) = {'Ui'};
M_.endo_names_tex(13) = {'Ui'};
M_.endo_names_long(13) = {'Lifetime utility of infected'};
M_.endo_names(14) = {'Us'};
M_.endo_names_tex(14) = {'Us'};
M_.endo_names_long(14) = {'Lifetime utility of susceptible'};
M_.endo_names(15) = {'Ur'};
M_.endo_names_tex(15) = {'Ur'};
M_.endo_names_long(15) = {'Lifetime utility of recovered'};
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
M_.endo_names(20) = {'ctilde'};
M_.endo_names_tex(20) = {'ctilde'};
M_.endo_names_long(20) = {'ctilde'};
M_.endo_names(21) = {'kuxc'};
M_.endo_names_tex(21) = {'kuxc'};
M_.endo_names_long(21) = {'kuxc'};
M_.endo_names(22) = {'ertc'};
M_.endo_names_tex(22) = {'ertc'};
M_.endo_names_long(22) = {'ertc'};
M_.endo_partitions = struct();
M_.param_names = cell(10,1);
M_.param_names_tex = cell(10,1);
M_.param_names_long = cell(10,1);
M_.param_names(1) = {'pi_a'};
M_.param_names_tex(1) = {'{\pi_a}'};
M_.param_names_long(1) = {'Probability of autonomous infection'};
M_.param_names(2) = {'eta'};
M_.param_names_tex(2) = {'{\eta}'};
M_.param_names_long(2) = {'Dlasticity of substitution'};
M_.param_names(3) = {'theta'};
M_.param_names_tex(3) = {'{\theta}'};
M_.param_names_long(3) = {'Labor supply parameter'};
M_.param_names(4) = {'A'};
M_.param_names_tex(4) = {'{A}'};
M_.param_names_long(4) = {'Productivity'};
M_.param_names(5) = {'betta'};
M_.param_names_tex(5) = {'{\beta}'};
M_.param_names_long(5) = {'Discount factor'};
M_.param_names(6) = {'phi1'};
M_.param_names_tex(6) = {'phi1'};
M_.param_names_long(6) = {'phi1'};
M_.param_names(7) = {'ups1'};
M_.param_names_tex(7) = {'ups1'};
M_.param_names_long(7) = {'ups1'};
M_.param_names(8) = {'alpha'};
M_.param_names_tex(8) = {'alpha'};
M_.param_names_long(8) = {'alpha'};
M_.param_names(9) = {'kappa'};
M_.param_names_tex(9) = {'kappa'};
M_.param_names_long(9) = {'kappa'};
M_.param_names(10) = {'pop'};
M_.param_names_tex(10) = {'pop'};
M_.param_names_long(10) = {'pop'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 22;
M_.param_nbr = 10;
M_.orig_endo_nbr = 22;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.nonzero_hessian_eqs = [1 3 6 7 8 11 12 18 19 21];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 22;
M_.eq_nbr = 22;
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
 0 18 28;
 0 19 29;
 0 20 30;
 0 21 0;
 0 22 0;
 0 23 0;
 0 24 0;
 0 25 0;
 0 26 0;
 0 27 0;]';
M_.nstatic = 14;
M_.nfwrd   = 3;
M_.npred   = 5;
M_.nboth   = 0;
M_.nsfwrd   = 3;
M_.nspred   = 5;
M_.ndynamic   = 8;
M_.dynamic_tmp_nbr = [16; 12; 4; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'FOC sector 1' ;
  2 , 'name' , 'c1_dev' ;
  3 , 'name' , 'FOC sector 2' ;
  4 , 'name' , 'c2_dev' ;
  5 , 'name' , '5' ;
  6 , 'name' , 'c' ;
  7 , 'name' , 'tau' ;
  8 , 'name' , 'lambda_tau' ;
  9 , 'name' , 'Ui' ;
  10 , 'name' , 'Ur' ;
  11 , 'name' , 'Us' ;
  12 , 'name' , 'T' ;
  13 , 'name' , '13' ;
  14 , 'name' , 'I' ;
  15 , 'name' , 'R' ;
  16 , 'name' , 'D' ;
  17 , 'name' , 'dD' ;
  18 , 'name' , 'C' ;
  19 , 'name' , 'N' ;
  20 , 'name' , 'ctilde' ;
  21 , 'name' , 'kuxc' ;
  22 , 'name' , 'ertc' ;
};
M_.mapping.n.eqidx = [1 3 5 11 19 ];
M_.mapping.c.eqidx = [1 3 6 11 18 ];
M_.mapping.lambda_tau.eqidx = [1 3 8 ];
M_.mapping.tau.eqidx = [7 11 12 ];
M_.mapping.I.eqidx = [1 3 7 13 14 15 16 18 19 ];
M_.mapping.T.eqidx = [12 14 ];
M_.mapping.S.eqidx = [12 13 18 19 ];
M_.mapping.R.eqidx = [15 18 19 ];
M_.mapping.D.eqidx = [16 17 ];
M_.mapping.dD.eqidx = [17 ];
M_.mapping.C.eqidx = [18 ];
M_.mapping.N.eqidx = [19 ];
M_.mapping.Ui.eqidx = [8 9 11 ];
M_.mapping.Us.eqidx = [8 11 ];
M_.mapping.Ur.eqidx = [9 10 ];
M_.mapping.c1.eqidx = [1 2 5 6 7 20 21 ];
M_.mapping.c1_dev.eqidx = [2 ];
M_.mapping.c2.eqidx = [3 4 5 6 7 20 21 ];
M_.mapping.c2_dev.eqidx = [4 ];
M_.mapping.ctilde.eqidx = [20 21 22 ];
M_.mapping.kuxc.eqidx = [21 ];
M_.mapping.ertc.eqidx = [22 ];
M_.mapping.pi_s.eqidx = [1 3 7 ];
M_.mapping.eps.eqidx = [14 ];
M_.mapping.step.eqidx = [1 3 7 ];
M_.mapping.SIR.eqidx = [8 11 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [5 6 7 8 9 ];
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(22, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(10, 1);
M_.endo_trends = struct('deflator', cell(22, 1), 'log_deflator', cell(22, 1), 'growth_factor', cell(22, 1), 'log_growth_factor', cell(22, 1));
M_.NNZDerivatives = [85; 81; -1; ];
M_.static_tmp_nbr = [15; 5; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(8) = 1e-3;
alpha = M_.params(8);
M_.params(9) = 7;
kappa = M_.params(9);
M_.params(6) = 0.3;
phi1 = M_.params(6);
I0      = 1;
winter  = 0;
M_.params(2) = 3;
eta = M_.params(2);
M_.params(1) = 0;
pi_a = M_.params(1);
M_.params(5) = 0.9992152697058329;
betta = M_.params(5);
M_.params(4) = 39.835;
A = M_.params(4);
M_.params(3) = 0.001275;
theta = M_.params(3);
M_.params(7) = 0.5;
ups1 = M_.params(7);
M_.params(10) = 1e5;
pop = M_.params(10);
steady;
save('kuxmain_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('kuxmain_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('kuxmain_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('kuxmain_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('kuxmain_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('kuxmain_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('kuxmain_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
