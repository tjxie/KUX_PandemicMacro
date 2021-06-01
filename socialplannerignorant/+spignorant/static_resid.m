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
    T = spignorant.static_resid_tt(T, y, x, params);
end
residual = zeros(20, 1);
lhs = y(14);
rhs = params(4)*y(2);
residual(1) = lhs - rhs;
lhs = y(3);
rhs = y(3)-y(4)+y(4)*(1-params(1)-params(2));
residual(2) = lhs - rhs;
lhs = y(4);
rhs = y(4)*(1-params(1)-params(2))+y(3)*y(4)*x(3)*(1+x(2))*y(15)+x(1);
residual(3) = lhs - rhs;
lhs = y(5);
rhs = y(5)+y(4)*params(1);
residual(4) = lhs - rhs;
lhs = T(2)/y(1)*T(3)+y(7);
rhs = y(12)*y(4)*(1+x(2))*x(3)*params(5)*y(9)*params(7);
residual(5) = lhs - rhs;
lhs = y(7)+T(4)/y(1)*T(5);
rhs = y(13)*y(4)*(1+x(2))*x(3)*params(5)*y(9)*params(8);
residual(6) = lhs - rhs;
lhs = y(2)*(-params(3));
rhs = params(4)*y(7);
residual(7) = lhs - rhs;
lhs = y(11)+y(8);
rhs = params(5)*(y(8)+y(15)*y(4)*(1+x(2))*x(3)*y(9));
residual(8) = lhs - rhs;
lhs = y(9)+y(11);
rhs = params(5)*((1-params(1)-params(2))*(y(9)+y(8))+y(15)*y(3)*(1+x(2))*x(3)*y(9)+params(1)*y(10))-y(8);
residual(9) = lhs - rhs;
lhs = y(11)+y(10);
rhs = params(5)*y(10);
residual(10) = lhs - rhs;
lhs = y(11);
rhs = log(y(1))-params(3)/2*y(2)^2;
residual(11) = lhs - rhs;
lhs = y(1);
rhs = T(6)^(params(6)/(params(6)-1));
residual(12) = lhs - rhs;
lhs = y(14);
rhs = y(12)+y(13);
residual(13) = lhs - rhs;
lhs = y(15);
rhs = y(12)*y(12)*params(7)+y(13)*y(13)*params(8);
residual(14) = lhs - rhs;
lhs = y(6);
rhs = y(6)+y(4)*params(2);
residual(15) = lhs - rhs;
lhs = y(16);
rhs = (y(3)*y(1)+y(4)*y(1)+y(5)*y(1))/T(7)-1;
residual(16) = lhs - rhs;
lhs = y(17);
rhs = (y(14)*y(3)+y(14)*y(4)+y(14)*y(5))/T(7)-1;
residual(17) = lhs - rhs;
lhs = y(18);
rhs = sqrt(params(3))*(y(2)*y(3)+y(2)*y(4)+y(2)*y(5))-1;
residual(18) = lhs - rhs;
lhs = y(19);
rhs = y(11)+params(5)*y(19);
residual(19) = lhs - rhs;
lhs = y(20);
rhs = y(19)*(y(5)+y(3)+y(4));
residual(20) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
