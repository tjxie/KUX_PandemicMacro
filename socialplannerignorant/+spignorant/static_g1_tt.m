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

assert(length(T) >= 10);

T = spignorant.static_resid_tt(T, y, x, params);

T(8) = getPowerDeriv(y(1)/y(12),T(1),1);
T(9) = getPowerDeriv(y(1)/y(13),T(1),1);
T(10) = getPowerDeriv(T(6),params(6)/(params(6)-1),1);

end
