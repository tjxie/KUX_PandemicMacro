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

assert(length(T) >= 9);

T(1) = 1/params(5);
T(2) = params(10)^T(1);
T(3) = (y(2)/y(16))^T(1);
T(4) = sqrt(params(6));
T(5) = params(12)^T(1);
T(6) = (y(2)/y(18))^T(1);
T(7) = T(2)*y(16)^(1-T(1))+T(5)*y(18)^(1-T(1));
T(8) = params(7)/T(4);
T(9) = log(T(8))-params(6)/2*(1/T(4))^2;

end
