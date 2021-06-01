function T = static_g1_tt(T, y, x, params)
% function T = static_g1_tt(T, y, x, params)
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

assert(length(T) >= 20);

T = kuxmain.static_resid_tt(T, y, x, params);

T(16) = getPowerDeriv(y(2)/y(16),T(5),1);
T(17) = getPowerDeriv(y(2)/y(18),T(5),1);
T(18) = 1/params(10);
T(19) = (-(params(4)*T(18)/T(8)/T(11)));
T(20) = getPowerDeriv(T(10),params(2)/(params(2)-1),1);

end
