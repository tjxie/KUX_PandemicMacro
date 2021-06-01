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
    T = sp.static_resid_tt(T, y, x, params);
end
residual = zeros(34, 1);
lhs = y(7)*y(24)+y(8)*y(25)+y(9)*y(26);
rhs = params(4)*(y(7)*y(4)+y(8)*y(5)+y(9)*y(6));
residual(1) = lhs - rhs;
lhs = y(7);
rhs = y(7)-y(8)+y(8)*(1-params(1)-params(2));
residual(2) = lhs - rhs;
lhs = y(8);
rhs = y(8)*(1-params(1)-params(2))+y(7)*y(8)*x(3)*(1+x(2))*y(27)+x(1);
residual(3) = lhs - rhs;
lhs = y(9);
rhs = y(9)+y(8)*params(1);
residual(4) = lhs - rhs;
lhs = T(2)/y(1)*T(3)+y(11);
rhs = y(8)*(1+x(2))*x(3)*params(5)*y(13)*params(7)*y(20);
residual(5) = lhs - rhs;
lhs = y(11)+T(4)/y(1)*T(5);
rhs = y(8)*(1+x(2))*x(3)*params(5)*y(13)*params(8)*y(21);
residual(6) = lhs - rhs;
lhs = y(11)+T(2)/y(2)*T(6);
rhs = y(18)*y(7)*(1+x(2))*x(3)*params(5)*y(13)*params(7);
residual(7) = lhs - rhs;
lhs = y(11)+T(4)/y(2)*T(7);
rhs = y(19)*y(7)*(1+x(2))*x(3)*params(5)*y(13)*params(8);
residual(8) = lhs - rhs;
residual(9) = y(11)+T(2)/y(3)*T(8);
residual(10) = y(11)+T(4)/y(3)*T(9);
lhs = y(4)*(-params(3));
rhs = params(4)*y(11);
residual(11) = lhs - rhs;
lhs = y(5)*(-params(3));
rhs = params(4)*y(11);
residual(12) = lhs - rhs;
lhs = y(6)*(-params(3));
rhs = params(4)*y(11);
residual(13) = lhs - rhs;
lhs = y(15)+y(24)*y(11)+y(12);
rhs = y(4)*params(4)*y(11)+params(5)*(y(12)+y(27)*y(8)*(1+x(2))*x(3)*y(13));
residual(14) = lhs - rhs;
lhs = y(13)+y(16)+y(25)*y(11);
rhs = y(5)*params(4)*y(11)-y(12)+params(5)*((1-params(1)-params(2))*(y(13)+y(12))+y(27)*y(7)*(1+x(2))*x(3)*y(13)+params(1)*y(14));
residual(15) = lhs - rhs;
lhs = y(14)+y(17)+y(26)*y(11);
rhs = y(6)*params(4)*y(11)+params(5)*y(14);
residual(16) = lhs - rhs;
lhs = y(15);
rhs = log(y(1))-T(10)*y(4)^2;
residual(17) = lhs - rhs;
lhs = y(16);
rhs = log(y(2))-T(10)*y(5)^2;
residual(18) = lhs - rhs;
lhs = y(17);
rhs = log(y(3))-T(10)*y(6)^2;
residual(19) = lhs - rhs;
lhs = y(1);
rhs = T(11)^T(12);
residual(20) = lhs - rhs;
lhs = y(2);
rhs = T(13)^T(12);
residual(21) = lhs - rhs;
lhs = y(3);
rhs = T(14)^T(12);
residual(22) = lhs - rhs;
lhs = y(24);
rhs = y(18)+y(19);
residual(23) = lhs - rhs;
lhs = y(25);
rhs = y(20)+y(21);
residual(24) = lhs - rhs;
lhs = y(26);
rhs = y(22)+y(23);
residual(25) = lhs - rhs;
lhs = y(27);
rhs = y(20)*y(18)*params(7)+y(21)*y(19)*params(8);
residual(26) = lhs - rhs;
lhs = y(10);
rhs = y(10)+y(8)*params(2);
residual(27) = lhs - rhs;
lhs = y(28);
rhs = (y(7)*y(1)+y(8)*y(2)+y(9)*y(3))/T(16)-1;
residual(28) = lhs - rhs;
lhs = y(29);
rhs = (y(7)*y(24)+y(8)*y(25)+y(9)*y(26))/T(16)-1;
residual(29) = lhs - rhs;
lhs = y(30);
rhs = (y(7)*y(4)+y(8)*y(5)+y(9)*y(6))*T(15)-1;
residual(30) = lhs - rhs;
lhs = y(31);
rhs = y(15)+params(5)*y(31);
residual(31) = lhs - rhs;
lhs = y(32);
rhs = y(16)+params(5)*y(32);
residual(32) = lhs - rhs;
lhs = y(33);
rhs = y(17)+params(5)*y(33);
residual(33) = lhs - rhs;
lhs = y(34);
rhs = y(7)*y(31)+y(8)*y(32)+y(9)*y(33);
residual(34) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
