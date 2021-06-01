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

T(1) = 7*params(8)/params(9);
T(2) = 7*(1-params(8))/params(9);
T(3) = (1-params(7)*params(6))/(1-params(7));
T(4) = 1/y(7);
T(5) = 1/params(2);
T(6) = (y(7)/y(21))^T(5);
T(7) = x(it_, 1)*(1+x(it_, 3))*y(10)/params(10);
T(8) = sqrt(params(3));
T(9) = (y(7)/y(23))^T(5);
T(10) = params(4)/T(8);
T(11) = y(10)*(1+x(it_, 3))*x(it_, 1)*T(10)/params(10);
T(12) = log(T(10))-params(3)/2*(1/T(8))^2;
T(13) = y(12)/params(10);
T(14) = params(7)*y(21)^(1-T(5))+(1-params(7))*y(23)^(1-T(5));
T(15) = params(7)*params(6)*y(21)+(1-params(7))*T(3)*y(23);
T(16) = y(1)*(1-T(2)-T(1));

end
