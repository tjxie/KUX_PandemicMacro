function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 9);

T(1) = 1/params(5);
T(2) = params(10)^T(1);
T(3) = (y(7)/y(20))^T(1);
T(4) = sqrt(params(6));
T(5) = params(12)^T(1);
T(6) = (y(7)/y(22))^T(1);
T(7) = T(2)*y(20)^(1-T(1))+T(5)*y(22)^(1-T(1));
T(8) = params(7)/T(4);
T(9) = log(T(8))-params(6)/2*(1/T(4))^2;

end
