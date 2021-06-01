%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'sp';
M_.dynare_version = '4.6.4';
oo_.dynare_version = '4.6.4';
options_.dynare_version = '4.6.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('sp.log');
M_.exo_names = cell(3,1);
M_.exo_names_tex = cell(3,1);
M_.exo_names_long = cell(3,1);
M_.exo_names(1) = {'eps'};
M_.exo_names_tex(1) = {'eps'};
M_.exo_names_long(1) = {'eps'};
M_.exo_names(2) = {'step'};
M_.exo_names_tex(2) = {'step'};
M_.exo_names_long(2) = {'step'};
M_.exo_names(3) = {'pi_s'};
M_.exo_names_tex(3) = {'pi\_s'};
M_.exo_names_long(3) = {'pi_s'};
M_.endo_names = cell(34,1);
M_.endo_names_tex = cell(34,1);
M_.endo_names_long = cell(34,1);
M_.endo_names(1) = {'cs'};
M_.endo_names_tex(1) = {'cs'};
M_.endo_names_long(1) = {'cs'};
M_.endo_names(2) = {'ci'};
M_.endo_names_tex(2) = {'ci'};
M_.endo_names_long(2) = {'ci'};
M_.endo_names(3) = {'cr'};
M_.endo_names_tex(3) = {'cr'};
M_.endo_names_long(3) = {'cr'};
M_.endo_names(4) = {'ns'};
M_.endo_names_tex(4) = {'ns'};
M_.endo_names_long(4) = {'ns'};
M_.endo_names(5) = {'ni'};
M_.endo_names_tex(5) = {'ni'};
M_.endo_names_long(5) = {'ni'};
M_.endo_names(6) = {'nr'};
M_.endo_names_tex(6) = {'nr'};
M_.endo_names_long(6) = {'nr'};
M_.endo_names(7) = {'S'};
M_.endo_names_tex(7) = {'S'};
M_.endo_names_long(7) = {'Susceptible'};
M_.endo_names(8) = {'I'};
M_.endo_names_tex(8) = {'I'};
M_.endo_names_long(8) = {'Infected'};
M_.endo_names(9) = {'R'};
M_.endo_names_tex(9) = {'R'};
M_.endo_names_long(9) = {'Recovered'};
M_.endo_names(10) = {'D'};
M_.endo_names_tex(10) = {'D'};
M_.endo_names_long(10) = {'Deceased'};
M_.endo_names(11) = {'mu_f'};
M_.endo_names_tex(11) = {'mu\_f'};
M_.endo_names_long(11) = {'mu_f'};
M_.endo_names(12) = {'mu_S'};
M_.endo_names_tex(12) = {'mu\_S'};
M_.endo_names_long(12) = {'mu_S'};
M_.endo_names(13) = {'mu_I'};
M_.endo_names_tex(13) = {'mu\_I'};
M_.endo_names_long(13) = {'mu_I'};
M_.endo_names(14) = {'mu_R'};
M_.endo_names_tex(14) = {'mu\_R'};
M_.endo_names_long(14) = {'mu_R'};
M_.endo_names(15) = {'us'};
M_.endo_names_tex(15) = {'us'};
M_.endo_names_long(15) = {'Period utility (S)'};
M_.endo_names(16) = {'ui'};
M_.endo_names_tex(16) = {'ui'};
M_.endo_names_long(16) = {'Period utility (I)'};
M_.endo_names(17) = {'ur'};
M_.endo_names_tex(17) = {'ur'};
M_.endo_names_long(17) = {'Period utility (R)'};
M_.endo_names(18) = {'c1s'};
M_.endo_names_tex(18) = {'c1s'};
M_.endo_names_long(18) = {'c1s'};
M_.endo_names(19) = {'c2s'};
M_.endo_names_tex(19) = {'c2s'};
M_.endo_names_long(19) = {'c2s'};
M_.endo_names(20) = {'c1i'};
M_.endo_names_tex(20) = {'c1i'};
M_.endo_names_long(20) = {'c1i'};
M_.endo_names(21) = {'c2i'};
M_.endo_names_tex(21) = {'c2i'};
M_.endo_names_long(21) = {'c2i'};
M_.endo_names(22) = {'c1r'};
M_.endo_names_tex(22) = {'c1r'};
M_.endo_names_long(22) = {'c1r'};
M_.endo_names(23) = {'c2r'};
M_.endo_names_tex(23) = {'c2r'};
M_.endo_names_long(23) = {'c2r'};
M_.endo_names(24) = {'int_cks'};
M_.endo_names_tex(24) = {'int\_cks'};
M_.endo_names_long(24) = {'int_cks'};
M_.endo_names(25) = {'int_cki'};
M_.endo_names_tex(25) = {'int\_cki'};
M_.endo_names_long(25) = {'int_cki'};
M_.endo_names(26) = {'int_ckr'};
M_.endo_names_tex(26) = {'int\_ckr'};
M_.endo_names_long(26) = {'int_ckr'};
M_.endo_names(27) = {'int_phi_cks_cki'};
M_.endo_names_tex(27) = {'int\_phi\_cks\_cki'};
M_.endo_names_long(27) = {'int_phi_cks_cki'};
M_.endo_names(28) = {'C'};
M_.endo_names_tex(28) = {'C'};
M_.endo_names_long(28) = {'Agg. consumption'};
M_.endo_names(29) = {'C_sum'};
M_.endo_names_tex(29) = {'C\_sum'};
M_.endo_names_long(29) = {'Agg. consumption'};
M_.endo_names(30) = {'N'};
M_.endo_names_tex(30) = {'N'};
M_.endo_names_long(30) = {'Agg. labor'};
M_.endo_names(31) = {'Us'};
M_.endo_names_tex(31) = {'Us'};
M_.endo_names_long(31) = {'Us'};
M_.endo_names(32) = {'Ui'};
M_.endo_names_tex(32) = {'Ui'};
M_.endo_names_long(32) = {'Ui'};
M_.endo_names(33) = {'Ur'};
M_.endo_names_tex(33) = {'Ur'};
M_.endo_names_long(33) = {'Ur'};
M_.endo_names(34) = {'welfare'};
M_.endo_names_tex(34) = {'welfare'};
M_.endo_names_long(34) = {'welfare'};
M_.endo_partitions = struct();
M_.param_names = cell(10,1);
M_.param_names_tex = cell(10,1);
M_.param_names_long = cell(10,1);
M_.param_names(1) = {'pi_r'};
M_.param_names_tex(1) = {'pi\_r'};
M_.param_names_long(1) = {'pi_r'};
M_.param_names(2) = {'pi_d'};
M_.param_names_tex(2) = {'pi\_d'};
M_.param_names_long(2) = {'pi_d'};
M_.param_names(3) = {'theta'};
M_.param_names_tex(3) = {'theta'};
M_.param_names_long(3) = {'theta'};
M_.param_names(4) = {'A'};
M_.param_names_tex(4) = {'A'};
M_.param_names_long(4) = {'A'};
M_.param_names(5) = {'betta'};
M_.param_names_tex(5) = {'betta'};
M_.param_names_long(5) = {'betta'};
M_.param_names(6) = {'eta'};
M_.param_names_tex(6) = {'eta'};
M_.param_names_long(6) = {'eta'};
M_.param_names(7) = {'phi1'};
M_.param_names_tex(7) = {'phi1'};
M_.param_names_long(7) = {'phi1'};
M_.param_names(8) = {'phi2'};
M_.param_names_tex(8) = {'phi2'};
M_.param_names_long(8) = {'phi2'};
M_.param_names(9) = {'ups1'};
M_.param_names_tex(9) = {'ups1'};
M_.param_names_long(9) = {'ups1'};
M_.param_names(10) = {'ups2'};
M_.param_names_tex(10) = {'ups2'};
M_.param_names_long(10) = {'ups2'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 34;
M_.param_nbr = 10;
M_.orig_endo_nbr = 34;
M_.aux_vars = [];
M_.Sigma_e = zeros(3, 3);
M_.Correlation_matrix = eye(3, 3);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.orig_eq_nbr = 34;
M_.eq_nbr = 34;
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
 0 10 0;
 0 11 0;
 1 12 0;
 2 13 0;
 3 14 0;
 4 15 0;
 0 16 0;
 0 17 40;
 0 18 41;
 0 19 42;
 0 20 0;
 0 21 0;
 0 22 0;
 0 23 0;
 0 24 0;
 0 25 0;
 0 26 0;
 0 27 0;
 0 28 0;
 0 29 0;
 0 30 0;
 0 31 0;
 5 32 0;
 0 33 0;
 0 34 0;
 0 35 0;
 0 36 43;
 0 37 44;
 0 38 45;
 0 39 0;]';
M_.nstatic = 23;
M_.nfwrd   = 6;
M_.npred   = 5;
M_.nboth   = 0;
M_.nsfwrd   = 6;
M_.nspred   = 5;
M_.ndynamic   = 11;
M_.dynamic_tmp_nbr = [16; 9; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'feasibility' ;
  2 , 'name' , 'S' ;
  3 , 'name' , 'I' ;
  4 , 'name' , 'R' ;
  5 , 'name' , 'FOC cs' ;
  6 , 'name' , '6' ;
  7 , 'name' , 'FOC ci' ;
  8 , 'name' , '8' ;
  9 , 'name' , 'FOC cr' ;
  10 , 'name' , '10' ;
  11 , 'name' , 'FOC n' ;
  12 , 'name' , '12' ;
  13 , 'name' , '13' ;
  14 , 'name' , 'FOC S' ;
  15 , 'name' , 'FOC I' ;
  16 , 'name' , 'FOC R' ;
  17 , 'name' , 'us' ;
  18 , 'name' , 'ui' ;
  19 , 'name' , 'ur' ;
  20 , 'name' , 'aggregation' ;
  21 , 'name' , 'ci' ;
  22 , 'name' , 'cr' ;
  23 , 'name' , 'integral' ;
  24 , 'name' , 'int_cki' ;
  25 , 'name' , 'int_ckr' ;
  26 , 'name' , 'integral in tau' ;
  27 , 'name' , 'D' ;
  28 , 'name' , 'C' ;
  29 , 'name' , 'C_sum' ;
  30 , 'name' , 'N' ;
  31 , 'name' , 'Us' ;
  32 , 'name' , 'Ui' ;
  33 , 'name' , 'Ur' ;
  34 , 'name' , 'welfare' ;
};
M_.mapping.cs.eqidx = [5 6 17 20 28 ];
M_.mapping.ci.eqidx = [7 8 18 21 28 ];
M_.mapping.cr.eqidx = [9 10 19 22 28 ];
M_.mapping.ns.eqidx = [1 11 14 17 30 ];
M_.mapping.ni.eqidx = [1 12 15 18 30 ];
M_.mapping.nr.eqidx = [1 13 16 19 30 ];
M_.mapping.S.eqidx = [1 2 3 7 8 15 28 29 30 34 ];
M_.mapping.I.eqidx = [1 2 3 4 5 6 14 27 28 29 30 34 ];
M_.mapping.R.eqidx = [1 4 28 29 30 34 ];
M_.mapping.D.eqidx = [27 ];
M_.mapping.mu_f.eqidx = [5 6 7 8 9 10 11 12 13 14 15 16 ];
M_.mapping.mu_S.eqidx = [14 15 ];
M_.mapping.mu_I.eqidx = [5 6 7 8 14 15 ];
M_.mapping.mu_R.eqidx = [15 16 ];
M_.mapping.us.eqidx = [14 17 31 ];
M_.mapping.ui.eqidx = [15 18 32 ];
M_.mapping.ur.eqidx = [16 19 33 ];
M_.mapping.c1s.eqidx = [5 7 20 23 26 ];
M_.mapping.c2s.eqidx = [6 8 20 23 26 ];
M_.mapping.c1i.eqidx = [5 7 21 24 26 ];
M_.mapping.c2i.eqidx = [6 8 21 24 26 ];
M_.mapping.c1r.eqidx = [9 22 25 ];
M_.mapping.c2r.eqidx = [10 22 25 ];
M_.mapping.int_cks.eqidx = [1 14 23 29 ];
M_.mapping.int_cki.eqidx = [1 15 24 29 ];
M_.mapping.int_ckr.eqidx = [1 16 25 29 ];
M_.mapping.int_phi_cks_cki.eqidx = [3 14 15 26 ];
M_.mapping.C.eqidx = [28 ];
M_.mapping.C_sum.eqidx = [29 ];
M_.mapping.N.eqidx = [30 ];
M_.mapping.Us.eqidx = [31 34 ];
M_.mapping.Ui.eqidx = [32 34 ];
M_.mapping.Ur.eqidx = [33 34 ];
M_.mapping.welfare.eqidx = [34 ];
M_.mapping.eps.eqidx = [3 ];
M_.mapping.step.eqidx = [3 5 6 7 8 14 15 ];
M_.mapping.pi_s.eqidx = [3 5 6 7 8 14 15 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [7 8 9 10 27 ];
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(34, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(10, 1);
M_.endo_trends = struct('deflator', cell(34, 1), 'log_deflator', cell(34, 1), 'growth_factor', cell(34, 1), 'log_growth_factor', cell(34, 1));
M_.NNZDerivatives = [169; -1; -1; ];
M_.static_tmp_nbr = [16; 9; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
set_param_value('eta',      3);
set_param_value('pi_d',     7*0.002/14);
set_param_value('pi_r',     7*(1-0.002)/14);
set_param_value('theta',    .001275);
set_param_value('betta',    0.96^(1/52));
set_param_value('A',        39.835);
set_param_value('phi1',     0.6);
set_param_value('ups1',     .5);
set_param_value('ups2',     .5);
set_param_value('phi2',     1.4);
%
% SHOCKS instructions
%
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',1:1,'value',0.0001) ];
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',2,'multiplicative',0,'periods',9:35,'value',(-0.7)) ];
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',3,'multiplicative',0,'periods',1:250,'value',1.48e-6) ];
M_.exo_det_length = 0;
options_.periods = 250;
perfect_foresight_setup;
oo_.endo_simul = csvread('init.csv');
perfect_foresight_solver;
clean_current_folder;
save('sp_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('sp_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('sp_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('sp_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('sp_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('sp_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('sp_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
