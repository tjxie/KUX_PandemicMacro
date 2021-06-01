function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 15);

T(1) = 7*params(8)/params(9);
T(2) = 7*(1-params(8))/params(9);
T(3) = (1-params(7)*params(6))/(1-params(7));
T(4) = 1/y(2);
T(5) = 1/params(2);
T(6) = (y(2)/y(16))^T(5);
T(7) = x(1)*(1+x(3))*y(5)/params(10);
T(8) = sqrt(params(3));
T(9) = (y(2)/y(18))^T(5);
T(10) = params(7)*y(16)^(1-T(5))+(1-params(7))*y(18)^(1-T(5));
T(11) = params(4)/T(8);
T(12) = y(5)*(1+x(3))*x(1)*T(11)/params(10);
T(13) = log(T(11))-params(3)/2*(1/T(8))^2;
T(14) = y(5)*(1-T(2)-T(1));
T(15) = y(7)/params(10);

end
