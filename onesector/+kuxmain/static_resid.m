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
    T = kuxmain.static_resid_tt(T, y, x, params);
end
residual = zeros(22, 1);
lhs = T(4)*T(6);
rhs = params(3)/params(4)*y(1)+params(4)*params(6)*T(7)*y(3)/T(8);
residual(1) = lhs - rhs;
lhs = y(17);
rhs = y(16)/(y(16))-1;
residual(2) = lhs - rhs;
lhs = T(4)*T(9);
rhs = params(3)/params(4)*y(1)+params(4)*T(3)*T(7)*y(3)/T(8);
residual(3) = lhs - rhs;
lhs = y(19);
rhs = y(18)/(y(18))-1;
residual(4) = lhs - rhs;
lhs = params(7)*y(16)+(1-params(7))*y(18);
rhs = params(4)*y(1);
residual(5) = lhs - rhs;
lhs = y(2);
rhs = T(10)^(params(2)/(params(2)-1));
residual(6) = lhs - rhs;
lhs = y(4);
rhs = y(5)*params(1)/params(10)+T(12)*(params(7)*params(6)*y(16)+(1-params(7))*T(3)*y(18));
residual(7) = lhs - rhs;
lhs = y(3);
rhs = (-params(5))*(y(13)-y(14))*(1-x(4));
residual(8) = lhs - rhs;
lhs = y(13);
rhs = T(13)+params(5)*(y(13)*(1-T(1)-T(2))+T(2)*y(15));
residual(9) = lhs - rhs;
lhs = y(15);
rhs = T(13)+params(5)*y(15);
residual(10) = lhs - rhs;
lhs = y(14);
rhs = log(y(2))-params(3)/2*y(1)^2+params(5)*((1-x(4))*(y(14)*(1-y(4))+y(4)*y(13))+y(14)*x(4));
residual(11) = lhs - rhs;
lhs = y(6);
rhs = y(4)*y(7);
residual(12) = lhs - rhs;
residual(13) = y(5)-T(14);
lhs = y(5);
rhs = x(2)+y(6)+T(14);
residual(14) = lhs - rhs;
lhs = y(8);
rhs = y(8)+T(2)*y(5);
residual(15) = lhs - rhs;
lhs = y(9);
rhs = y(9)+T(1)*y(5);
residual(16) = lhs - rhs;
residual(17) = y(10);
lhs = y(11);
rhs = (y(2)*T(15)+params(4)*(y(5)+y(8))/params(10)/T(8))/T(11)-1;
residual(18) = lhs - rhs;
lhs = y(12);
rhs = T(8)*(y(1)*T(15)+(y(5)+y(8))/params(10)/T(8))-1;
residual(19) = lhs - rhs;
lhs = y(20);
rhs = 0.5*(y(16)+y(18));
residual(20) = lhs - rhs;
lhs = y(21);
rhs = 0.5*(params(6)*y(16)+T(3)*y(18))/y(20);
residual(21) = lhs - rhs;
lhs = y(22);
rhs = y(20)/T(11);
residual(22) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
