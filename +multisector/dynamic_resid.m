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
    T = multisector.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(19, 1);
lhs = T(2)*1/y(7)*T(3);
rhs = params(6)/params(7)*y(6)+params(7)*params(10)*2*params(1)*y(10)*y(8)*params(9)/T(4);
residual(1) = lhs - rhs;
lhs = y(22);
rhs = y(21)/(steady_state(16))-1;
residual(2) = lhs - rhs;
lhs = 1/y(7)*T(5)*T(6);
rhs = params(6)/params(7)*y(6)+params(7)*params(12)*2*params(1)*y(10)*y(8)*params(11)/T(4);
residual(3) = lhs - rhs;
lhs = y(24);
rhs = y(23)/(steady_state(18))-1;
residual(4) = lhs - rhs;
lhs = y(21)+y(23);
rhs = params(7)*y(6);
residual(5) = lhs - rhs;
lhs = y(7);
rhs = T(7)^(params(5)/(params(5)-1));
residual(6) = lhs - rhs;
lhs = y(9);
rhs = y(10)*params(1)*2*T(8)*(params(10)*y(21)*params(9)+params(12)*y(23)*params(11))+y(10)*params(2);
residual(7) = lhs - rhs;
lhs = y(8);
rhs = (-params(8))*(y(25)-y(26));
residual(8) = lhs - rhs;
lhs = y(17);
rhs = T(9)+params(8)*(y(25)*(1-params(4)-params(3))+params(3)*y(27));
residual(9) = lhs - rhs;
lhs = y(19);
rhs = T(9)+params(8)*y(27);
residual(10) = lhs - rhs;
lhs = y(18);
rhs = log(y(7))-params(6)/2*y(6)^2+params(8)*(y(26)*(1-y(9))+y(9)*y(25));
residual(11) = lhs - rhs;
lhs = y(11);
rhs = y(9)*y(12);
residual(12) = lhs - rhs;
residual(13) = y(10)+y(12)-y(3)-(1-params(3)-params(4))*y(1);
lhs = y(10);
rhs = (1-params(3)-params(4))*y(1)+y(2)+x(it_, 1);
residual(14) = lhs - rhs;
lhs = y(13);
rhs = y(4)+params(3)*y(1);
residual(15) = lhs - rhs;
lhs = y(14);
rhs = y(5)+params(4)*y(1);
residual(16) = lhs - rhs;
lhs = y(20);
rhs = y(14)-y(5);
residual(17) = lhs - rhs;
lhs = y(15);
rhs = (y(7)*y(12)+params(7)*(y(10)+y(13))/T(4))/T(8)-1;
residual(18) = lhs - rhs;
lhs = y(16);
rhs = T(4)*(y(6)*y(12)+(y(10)+y(13))/T(4))-1;
residual(19) = lhs - rhs;

end
