function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = sp.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(34, 1);
lhs = y(12)*y(29)+y(13)*y(30)+y(14)*y(31);
rhs = params(4)*(y(12)*y(9)+y(13)*y(10)+y(14)*y(11));
residual(1) = lhs - rhs;
lhs = y(12);
rhs = y(1)-y(13)+(1-params(1)-params(2))*y(2);
residual(2) = lhs - rhs;
lhs = y(13);
rhs = (1-params(1)-params(2))*y(2)+y(1)*y(2)*x(it_, 3)*(1+x(it_, 2))*y(5)+x(it_, 1);
residual(3) = lhs - rhs;
lhs = y(14);
rhs = y(3)+params(1)*y(2);
residual(4) = lhs - rhs;
lhs = T(2)/y(6)*T(3)+y(16);
rhs = y(13)*(1+x(it_, 2))*x(it_, 3)*params(5)*y(41)*params(7)*y(25);
residual(5) = lhs - rhs;
lhs = y(16)+T(4)/y(6)*T(5);
rhs = y(13)*(1+x(it_, 2))*x(it_, 3)*params(5)*y(41)*params(8)*y(26);
residual(6) = lhs - rhs;
lhs = y(16)+T(2)/y(7)*T(6);
rhs = y(23)*y(12)*(1+x(it_, 2))*x(it_, 3)*params(5)*y(41)*params(7);
residual(7) = lhs - rhs;
lhs = y(16)+T(4)/y(7)*T(7);
rhs = y(24)*y(12)*(1+x(it_, 2))*x(it_, 3)*params(5)*y(41)*params(8);
residual(8) = lhs - rhs;
residual(9) = y(16)+T(2)/y(8)*T(8);
residual(10) = y(16)+T(4)/y(8)*T(9);
lhs = y(9)*(-params(3));
rhs = params(4)*y(16);
residual(11) = lhs - rhs;
lhs = y(10)*(-params(3));
rhs = params(4)*y(16);
residual(12) = lhs - rhs;
lhs = y(11)*(-params(3));
rhs = params(4)*y(16);
residual(13) = lhs - rhs;
lhs = y(20)+y(29)*y(16)+y(17);
rhs = y(9)*params(4)*y(16)+params(5)*(y(40)+y(13)*(1+x(it_, 2))*x(it_, 3)*y(41)*y(32));
residual(14) = lhs - rhs;
lhs = y(21)+y(30)*y(16)+y(18);
rhs = y(10)*params(4)*y(16)-y(17)+params(5)*((1-params(1)-params(2))*(y(41)+y(40))+y(32)*y(12)*(1+x(it_, 2))*x(it_, 3)*y(41)+params(1)*y(42));
residual(15) = lhs - rhs;
lhs = y(22)+y(31)*y(16)+y(19);
rhs = y(11)*params(4)*y(16)+params(5)*y(42);
residual(16) = lhs - rhs;
lhs = y(20);
rhs = log(y(6))-T(10)*y(9)^2;
residual(17) = lhs - rhs;
lhs = y(21);
rhs = log(y(7))-T(10)*y(10)^2;
residual(18) = lhs - rhs;
lhs = y(22);
rhs = log(y(8))-T(10)*y(11)^2;
residual(19) = lhs - rhs;
lhs = y(6);
rhs = T(11)^T(12);
residual(20) = lhs - rhs;
lhs = y(7);
rhs = T(13)^T(12);
residual(21) = lhs - rhs;
lhs = y(8);
rhs = T(14)^T(12);
residual(22) = lhs - rhs;
lhs = y(29);
rhs = y(23)+y(24);
residual(23) = lhs - rhs;
lhs = y(30);
rhs = y(25)+y(26);
residual(24) = lhs - rhs;
lhs = y(31);
rhs = y(27)+y(28);
residual(25) = lhs - rhs;
lhs = y(32);
rhs = y(25)*y(23)*params(7)+y(26)*y(24)*params(8);
residual(26) = lhs - rhs;
lhs = y(15);
rhs = y(4)+params(2)*y(2);
residual(27) = lhs - rhs;
lhs = y(33);
rhs = (y(12)*y(6)+y(13)*y(7)+y(14)*y(8))/T(16)-1;
residual(28) = lhs - rhs;
lhs = y(34);
rhs = (y(12)*y(29)+y(13)*y(30)+y(14)*y(31))/T(16)-1;
residual(29) = lhs - rhs;
lhs = y(35);
rhs = (y(12)*y(9)+y(13)*y(10)+y(14)*y(11))*T(15)-1;
residual(30) = lhs - rhs;
lhs = y(36);
rhs = y(20)+params(5)*y(43);
residual(31) = lhs - rhs;
lhs = y(37);
rhs = y(21)+params(5)*y(44);
residual(32) = lhs - rhs;
lhs = y(38);
rhs = y(22)+params(5)*y(45);
residual(33) = lhs - rhs;
lhs = y(39);
rhs = y(12)*y(36)+y(13)*y(37)+y(14)*y(38);
residual(34) = lhs - rhs;

end
