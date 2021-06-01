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

assert(length(T) >= 16);

T(1) = 1/params(6);
T(2) = params(9)^T(1);
T(3) = (y(1)/y(18))^T(1);
T(4) = params(10)^T(1);
T(5) = (y(1)/y(19))^T(1);
T(6) = (y(2)/y(20))^T(1);
T(7) = (y(2)/y(21))^T(1);
T(8) = (y(3)/y(22))^T(1);
T(9) = (y(3)/y(23))^T(1);
T(10) = params(3)/2;
T(11) = T(2)*y(18)^(1-T(1))+T(4)*y(19)^(1-T(1));
T(12) = params(6)/(params(6)-1);
T(13) = T(2)*y(20)^(1-T(1))+T(4)*y(21)^(1-T(1));
T(14) = T(2)*y(22)^(1-T(1))+T(4)*y(23)^(1-T(1));
T(15) = sqrt(params(3));
T(16) = params(4)/T(15);

end
