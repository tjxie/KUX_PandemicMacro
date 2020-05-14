function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = multisector.static_resid_tt(T, y, x, params);
end
residual = zeros(18, 1);
lhs = T(2)*1/y(2)*T(3);
rhs = params(6)/params(7)*y(1)+params(7)*params(10)*2*params(1)*y(5)*y(3)*params(9)/T(4);
residual(1) = lhs - rhs;
lhs = y(16);
rhs = y(15)/(y(15))-1;
residual(2) = lhs - rhs;
lhs = 1/y(2)*T(5)*T(6);
rhs = params(6)/params(7)*y(1)+params(7)*params(12)*2*params(1)*y(5)*y(3)*params(11)/T(4);
residual(3) = lhs - rhs;
lhs = y(18);
rhs = y(17)/(y(17))-1;
residual(4) = lhs - rhs;
lhs = y(15)+y(17);
rhs = params(7)*y(1);
residual(5) = lhs - rhs;
lhs = y(2);
rhs = T(7)^(params(5)/(params(5)-1));
residual(6) = lhs - rhs;
lhs = y(4);
rhs = y(5)*params(1)*2*T(8)*(params(10)*y(15)*params(9)+params(12)*y(17)*params(11))+y(5)*params(2);
residual(7) = lhs - rhs;
lhs = y(3);
rhs = (-params(8))*(y(12)-y(13));
residual(8) = lhs - rhs;
lhs = y(12);
rhs = T(9)+params(8)*(y(12)*(1-params(4)-params(3))+params(3)*y(14));
residual(9) = lhs - rhs;
lhs = y(14);
rhs = T(9)+params(8)*y(14);
residual(10) = lhs - rhs;
lhs = y(13);
rhs = log(y(2))-params(6)/2*y(1)^2+params(8)*(y(13)*(1-y(4))+y(4)*y(12));
residual(11) = lhs - rhs;
lhs = y(6);
rhs = y(4)*y(7);
residual(12) = lhs - rhs;
residual(13) = y(5)-y(5)*(1-params(3)-params(4));
lhs = y(5);
rhs = y(6)+y(5)*(1-params(3)-params(4))+x(1);
residual(14) = lhs - rhs;
lhs = y(8);
rhs = y(8)+y(5)*params(3);
residual(15) = lhs - rhs;
lhs = y(9);
rhs = y(9)+y(5)*params(4);
residual(16) = lhs - rhs;
lhs = y(10);
rhs = (y(2)*y(7)+params(7)*(y(5)+y(8))/T(4))/T(8)-1;
residual(17) = lhs - rhs;
lhs = y(11);
rhs = T(4)*(y(1)*y(7)+(y(5)+y(8))/T(4))-1;
residual(18) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
