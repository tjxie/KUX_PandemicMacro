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

assert(length(T) >= 7);

T(1) = 1/params(6);
T(2) = params(9)^T(1);
T(3) = (y(1)/y(12))^T(1);
T(4) = params(10)^T(1);
T(5) = (y(1)/y(13))^T(1);
T(6) = T(2)*y(12)^(1-T(1))+T(4)*y(13)^(1-T(1));
T(7) = params(4)/sqrt(params(3));

end
