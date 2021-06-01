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

assert(length(T) >= 16);

T(1) = 1/params(6);
T(2) = params(9)^T(1);
T(3) = (y(6)/y(23))^T(1);
T(4) = params(10)^T(1);
T(5) = (y(6)/y(24))^T(1);
T(6) = (y(7)/y(25))^T(1);
T(7) = (y(7)/y(26))^T(1);
T(8) = (y(8)/y(27))^T(1);
T(9) = (y(8)/y(28))^T(1);
T(10) = params(3)/2;
T(11) = T(2)*y(23)^(1-T(1))+T(4)*y(24)^(1-T(1));
T(12) = params(6)/(params(6)-1);
T(13) = T(2)*y(25)^(1-T(1))+T(4)*y(26)^(1-T(1));
T(14) = T(2)*y(27)^(1-T(1))+T(4)*y(28)^(1-T(1));
T(15) = sqrt(params(3));
T(16) = params(4)/T(15);

end
