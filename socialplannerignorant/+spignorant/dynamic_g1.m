function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = spignorant.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(20, 32);
g1(1,7)=(-params(4));
g1(1,19)=1;
g1(2,1)=(-1);
g1(2,8)=1;
g1(2,2)=(-(1-params(1)-params(2)));
g1(2,9)=1;
g1(3,1)=(-(y(2)*x(it_, 3)*(1+x(it_, 2))*y(5)));
g1(3,2)=(-(1-params(1)-params(2)+y(5)*y(1)*x(it_, 3)*(1+x(it_, 2))));
g1(3,9)=1;
g1(3,5)=(-(y(1)*y(2)*x(it_, 3)*(1+x(it_, 2))));
g1(3,30)=(-1);
g1(3,31)=(-(y(5)*y(1)*y(2)*x(it_, 3)));
g1(3,32)=(-(y(5)*y(1)*y(2)*(1+x(it_, 2))));
g1(4,2)=(-params(1));
g1(4,3)=(-1);
g1(4,10)=1;
g1(5,6)=T(3)*(-T(2))/(y(6)*y(6))+T(2)/y(6)*1/y(17)*T(8);
g1(5,9)=(-(y(17)*(1+x(it_, 2))*x(it_, 3)*params(5)*y(27)*params(7)));
g1(5,12)=1;
g1(5,27)=(-(y(17)*y(9)*params(7)*(1+x(it_, 2))*x(it_, 3)*params(5)));
g1(5,17)=T(2)/y(6)*T(8)*(-y(6))/(y(17)*y(17))-y(9)*(1+x(it_, 2))*x(it_, 3)*params(5)*y(27)*params(7);
g1(5,31)=(-(y(17)*y(9)*x(it_, 3)*params(5)*y(27)*params(7)));
g1(5,32)=(-(y(17)*y(9)*params(7)*(1+x(it_, 2))*params(5)*y(27)));
g1(6,6)=T(5)*(-T(4))/(y(6)*y(6))+T(4)/y(6)*1/y(18)*T(9);
g1(6,9)=(-(y(18)*(1+x(it_, 2))*x(it_, 3)*params(5)*y(27)*params(8)));
g1(6,12)=1;
g1(6,27)=(-(y(18)*y(9)*params(8)*(1+x(it_, 2))*x(it_, 3)*params(5)));
g1(6,18)=T(4)/y(6)*T(9)*(-y(6))/(y(18)*y(18))-y(9)*(1+x(it_, 2))*x(it_, 3)*params(5)*y(27)*params(8);
g1(6,31)=(-(y(18)*y(9)*x(it_, 3)*params(5)*y(27)*params(8)));
g1(6,32)=(-(y(18)*y(9)*params(8)*(1+x(it_, 2))*params(5)*y(27)));
g1(7,7)=(-params(3));
g1(7,12)=(-params(4));
g1(8,9)=(-(params(5)*(1+x(it_, 2))*x(it_, 3)*y(27)*y(20)));
g1(8,13)=1;
g1(8,26)=(-params(5));
g1(8,27)=(-(params(5)*y(20)*y(9)*x(it_, 3)*(1+x(it_, 2))));
g1(8,16)=1;
g1(8,20)=(-(params(5)*y(9)*(1+x(it_, 2))*x(it_, 3)*y(27)));
g1(8,31)=(-(params(5)*y(20)*y(9)*x(it_, 3)*y(27)));
g1(8,32)=(-(params(5)*y(20)*y(9)*(1+x(it_, 2))*y(27)));
g1(9,8)=(-(params(5)*(1+x(it_, 2))*x(it_, 3)*y(27)*y(20)));
g1(9,13)=1;
g1(9,26)=(-((1-params(1)-params(2))*params(5)));
g1(9,14)=1;
g1(9,27)=(-(params(5)*(1-params(1)-params(2)+y(20)*y(8)*x(it_, 3)*(1+x(it_, 2)))));
g1(9,28)=(-(params(1)*params(5)));
g1(9,16)=1;
g1(9,20)=(-(params(5)*y(8)*(1+x(it_, 2))*x(it_, 3)*y(27)));
g1(9,31)=(-(params(5)*y(20)*y(8)*x(it_, 3)*y(27)));
g1(9,32)=(-(params(5)*y(20)*y(8)*(1+x(it_, 2))*y(27)));
g1(10,15)=1;
g1(10,28)=(-params(5));
g1(10,16)=1;
g1(11,6)=(-(1/y(6)));
g1(11,7)=params(3)/2*2*y(7);
g1(11,16)=1;
g1(12,6)=1;
g1(12,17)=(-(T(2)*getPowerDeriv(y(17),1-T(1),1)*T(10)));
g1(12,18)=(-(T(10)*T(4)*getPowerDeriv(y(18),1-T(1),1)));
g1(13,17)=(-1);
g1(13,18)=(-1);
g1(13,19)=1;
g1(14,17)=(-(y(17)*params(7)+y(17)*params(7)));
g1(14,18)=(-(y(18)*params(8)+y(18)*params(8)));
g1(14,20)=1;
g1(15,2)=(-params(2));
g1(15,4)=(-1);
g1(15,11)=1;
g1(16,6)=(-((y(10)+y(8)+y(9))/T(7)));
g1(16,8)=(-(y(6)/T(7)));
g1(16,9)=(-(y(6)/T(7)));
g1(16,10)=(-(y(6)/T(7)));
g1(16,21)=1;
g1(17,8)=(-(y(19)/T(7)));
g1(17,9)=(-(y(19)/T(7)));
g1(17,10)=(-(y(19)/T(7)));
g1(17,19)=(-((y(10)+y(8)+y(9))/T(7)));
g1(17,22)=1;
g1(18,7)=(-(sqrt(params(3))*(y(10)+y(8)+y(9))));
g1(18,8)=(-(y(7)*sqrt(params(3))));
g1(18,9)=(-(y(7)*sqrt(params(3))));
g1(18,10)=(-(y(7)*sqrt(params(3))));
g1(18,23)=1;
g1(19,16)=(-1);
g1(19,24)=1;
g1(19,29)=(-params(5));
g1(20,8)=(-y(24));
g1(20,9)=(-y(24));
g1(20,10)=(-y(24));
g1(20,24)=(-(y(10)+y(8)+y(9)));
g1(20,25)=1;

end
