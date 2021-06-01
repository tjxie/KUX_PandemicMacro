function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 28);

T = kuxmain.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(17) = (-1)/(y(7)*y(7));
T(18) = 1/y(21);
T(19) = getPowerDeriv(y(7)/y(21),T(5),1);
T(20) = 1/y(23);
T(21) = getPowerDeriv(y(7)/y(23),T(5),1);
T(22) = (1+x(it_, 3))*x(it_, 1)*T(10)/params(10);
T(23) = 1/params(10);
T(24) = (-(params(4)*T(23)/T(8)/T(10)));
T(25) = params(7)*getPowerDeriv(y(21),1-T(5),1);
T(26) = getPowerDeriv(T(14),params(2)/(params(2)-1),1);
T(27) = (1-params(7))*getPowerDeriv(y(23),1-T(5),1);
T(28) = y(10)*(1+x(it_, 3))*T(10)/params(10);

end
