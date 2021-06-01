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
    T = kuxmain.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(22, 1);
lhs = T(4)*T(6);
rhs = params(3)/params(4)*y(6)+params(4)*params(6)*T(7)*y(8)/T(8);
residual(1) = lhs - rhs;
lhs = y(22);
rhs = y(21)/(steady_state(16))-1;
residual(2) = lhs - rhs;
lhs = T(4)*T(9);
rhs = params(3)/params(4)*y(6)+params(4)*T(3)*T(7)*y(8)/T(8);
residual(3) = lhs - rhs;
lhs = y(24);
rhs = y(23)/(steady_state(18))-1;
residual(4) = lhs - rhs;
lhs = params(7)*y(21)+(1-params(7))*y(23);
rhs = params(4)*y(6);
residual(5) = lhs - rhs;
lhs = y(7);
rhs = T(14)^(params(2)/(params(2)-1));
residual(6) = lhs - rhs;
lhs = y(9);
rhs = y(10)*params(1)/params(10)+T(11)*T(15);
residual(7) = lhs - rhs;
lhs = y(8);
rhs = (-params(5))*(y(28)-y(29))*(1-x(it_, 4));
residual(8) = lhs - rhs;
lhs = y(18);
rhs = T(12)+params(5)*(y(28)*(1-T(1)-T(2))+T(2)*y(30));
residual(9) = lhs - rhs;
lhs = y(20);
rhs = T(12)+params(5)*y(30);
residual(10) = lhs - rhs;
lhs = y(19);
rhs = log(y(7))-params(3)/2*y(6)^2+params(5)*((1-x(it_, 4))*(y(29)*(1-y(9))+y(9)*y(28))+y(29)*x(it_, 4));
residual(11) = lhs - rhs;
lhs = y(11);
rhs = y(9)*y(12);
residual(12) = lhs - rhs;
residual(13) = y(10)+y(12)-y(3)-T(16);
lhs = y(10);
rhs = x(it_, 2)+y(2)+T(16);
residual(14) = lhs - rhs;
lhs = y(13);
rhs = y(4)+T(2)*y(1);
residual(15) = lhs - rhs;
lhs = y(14);
rhs = y(5)+T(1)*y(1);
residual(16) = lhs - rhs;
lhs = y(15);
rhs = y(14)-y(5);
residual(17) = lhs - rhs;
lhs = y(16);
rhs = (y(7)*T(13)+params(4)*(y(10)+y(13))/params(10)/T(8))/T(10)-1;
residual(18) = lhs - rhs;
lhs = y(17);
rhs = T(8)*(y(6)*T(13)+(y(10)+y(13))/params(10)/T(8))-1;
residual(19) = lhs - rhs;
lhs = y(25);
rhs = 0.5*(y(21)+y(23));
residual(20) = lhs - rhs;
lhs = y(26);
rhs = 0.5*(params(6)*y(21)+T(3)*y(23))/y(25);
residual(21) = lhs - rhs;
lhs = y(27);
rhs = y(25)/T(10);
residual(22) = lhs - rhs;

end
