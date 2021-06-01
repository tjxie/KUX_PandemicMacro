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

assert(length(T) >= 25);

T = sp.static_resid_tt(T, y, x, params);

T(17) = getPowerDeriv(y(1)/y(18),T(1),1);
T(18) = getPowerDeriv(y(1)/y(19),T(1),1);
T(19) = getPowerDeriv(y(2)/y(20),T(1),1);
T(20) = getPowerDeriv(y(2)/y(21),T(1),1);
T(21) = getPowerDeriv(y(3)/y(22),T(1),1);
T(22) = getPowerDeriv(y(3)/y(23),T(1),1);
T(23) = getPowerDeriv(T(11),T(12),1);
T(24) = getPowerDeriv(T(13),T(12),1);
T(25) = getPowerDeriv(T(14),T(12),1);

end
