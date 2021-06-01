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
    T = spignorant.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(20, 1);
lhs = y(19);
rhs = params(4)*y(7);
residual(1) = lhs - rhs;
lhs = y(8);
rhs = y(1)-y(9)+(1-params(1)-params(2))*y(2);
residual(2) = lhs - rhs;
lhs = y(9);
rhs = (1-params(1)-params(2))*y(2)+y(1)*y(2)*x(it_, 3)*(1+x(it_, 2))*y(5)+x(it_, 1);
residual(3) = lhs - rhs;
lhs = y(10);
rhs = y(3)+params(1)*y(2);
residual(4) = lhs - rhs;
lhs = T(2)/y(6)*T(3)+y(12);
rhs = y(17)*y(9)*(1+x(it_, 2))*x(it_, 3)*params(5)*y(27)*params(7);
residual(5) = lhs - rhs;
lhs = y(12)+T(4)/y(6)*T(5);
rhs = y(18)*y(9)*(1+x(it_, 2))*x(it_, 3)*params(5)*y(27)*params(8);
residual(6) = lhs - rhs;
lhs = y(7)*(-params(3));
rhs = params(4)*y(12);
residual(7) = lhs - rhs;
lhs = y(16)+y(13);
rhs = params(5)*(y(26)+y(9)*(1+x(it_, 2))*x(it_, 3)*y(27)*y(20));
residual(8) = lhs - rhs;
lhs = y(16)+y(14);
rhs = params(5)*((1-params(1)-params(2))*(y(27)+y(26))+y(20)*y(8)*(1+x(it_, 2))*x(it_, 3)*y(27)+params(1)*y(28))-y(13);
residual(9) = lhs - rhs;
lhs = y(16)+y(15);
rhs = params(5)*y(28);
residual(10) = lhs - rhs;
lhs = y(16);
rhs = log(y(6))-params(3)/2*y(7)^2;
residual(11) = lhs - rhs;
lhs = y(6);
rhs = T(6)^(params(6)/(params(6)-1));
residual(12) = lhs - rhs;
lhs = y(19);
rhs = y(17)+y(18);
residual(13) = lhs - rhs;
lhs = y(20);
rhs = y(17)*y(17)*params(7)+y(18)*y(18)*params(8);
residual(14) = lhs - rhs;
lhs = y(11);
rhs = y(4)+params(2)*y(2);
residual(15) = lhs - rhs;
lhs = y(21);
rhs = (y(8)*y(6)+y(9)*y(6)+y(10)*y(6))/T(7)-1;
residual(16) = lhs - rhs;
lhs = y(22);
rhs = (y(19)*y(8)+y(19)*y(9)+y(19)*y(10))/T(7)-1;
residual(17) = lhs - rhs;
lhs = y(23);
rhs = sqrt(params(3))*(y(7)*y(8)+y(7)*y(9)+y(7)*y(10))-1;
residual(18) = lhs - rhs;
lhs = y(24);
rhs = y(16)+params(5)*y(29);
residual(19) = lhs - rhs;
lhs = y(25);
rhs = y(24)*(y(10)+y(8)+y(9));
residual(20) = lhs - rhs;

end
