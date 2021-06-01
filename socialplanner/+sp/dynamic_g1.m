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
    T = sp.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(34, 48);
g1(1,9)=(-(y(12)*params(4)));
g1(1,10)=(-(y(13)*params(4)));
g1(1,11)=(-(y(14)*params(4)));
g1(1,12)=y(29)-params(4)*y(9);
g1(1,13)=y(30)-params(4)*y(10);
g1(1,14)=y(31)-params(4)*y(11);
g1(1,29)=y(12);
g1(1,30)=y(13);
g1(1,31)=y(14);
g1(2,1)=(-1);
g1(2,12)=1;
g1(2,2)=(-(1-params(1)-params(2)));
g1(2,13)=1;
g1(3,1)=(-(y(2)*x(it_, 3)*(1+x(it_, 2))*y(5)));
g1(3,2)=(-(1-params(1)-params(2)+y(5)*y(1)*x(it_, 3)*(1+x(it_, 2))));
g1(3,13)=1;
g1(3,5)=(-(y(1)*y(2)*x(it_, 3)*(1+x(it_, 2))));
g1(3,46)=(-1);
g1(3,47)=(-(y(5)*y(1)*y(2)*x(it_, 3)));
g1(3,48)=(-(y(5)*y(1)*y(2)*(1+x(it_, 2))));
g1(4,2)=(-params(1));
g1(4,3)=(-1);
g1(4,14)=1;
g1(5,6)=T(3)*(-T(2))/(y(6)*y(6))+T(2)/y(6)*1/y(23)*T(17);
g1(5,13)=(-((1+x(it_, 2))*x(it_, 3)*params(5)*y(41)*params(7)*y(25)));
g1(5,16)=1;
g1(5,41)=(-(y(25)*y(13)*params(7)*(1+x(it_, 2))*x(it_, 3)*params(5)));
g1(5,23)=T(2)/y(6)*T(17)*(-y(6))/(y(23)*y(23));
g1(5,25)=(-(y(13)*(1+x(it_, 2))*x(it_, 3)*params(5)*y(41)*params(7)));
g1(5,47)=(-(y(25)*y(13)*x(it_, 3)*params(5)*y(41)*params(7)));
g1(5,48)=(-(y(25)*y(13)*params(7)*(1+x(it_, 2))*params(5)*y(41)));
g1(6,6)=T(5)*(-T(4))/(y(6)*y(6))+T(4)/y(6)*1/y(24)*T(18);
g1(6,13)=(-((1+x(it_, 2))*x(it_, 3)*params(5)*y(41)*params(8)*y(26)));
g1(6,16)=1;
g1(6,41)=(-(y(26)*y(13)*params(8)*(1+x(it_, 2))*x(it_, 3)*params(5)));
g1(6,24)=T(4)/y(6)*T(18)*(-y(6))/(y(24)*y(24));
g1(6,26)=(-(y(13)*(1+x(it_, 2))*x(it_, 3)*params(5)*y(41)*params(8)));
g1(6,47)=(-(y(26)*y(13)*x(it_, 3)*params(5)*y(41)*params(8)));
g1(6,48)=(-(y(26)*y(13)*params(8)*(1+x(it_, 2))*params(5)*y(41)));
g1(7,7)=T(6)*(-T(2))/(y(7)*y(7))+T(2)/y(7)*1/y(25)*T(19);
g1(7,12)=(-(y(23)*(1+x(it_, 2))*x(it_, 3)*params(5)*y(41)*params(7)));
g1(7,16)=1;
g1(7,41)=(-(y(23)*y(12)*params(7)*(1+x(it_, 2))*x(it_, 3)*params(5)));
g1(7,23)=(-(y(12)*(1+x(it_, 2))*x(it_, 3)*params(5)*y(41)*params(7)));
g1(7,25)=T(2)/y(7)*T(19)*(-y(7))/(y(25)*y(25));
g1(7,47)=(-(y(23)*y(12)*x(it_, 3)*params(5)*y(41)*params(7)));
g1(7,48)=(-(y(23)*y(12)*params(7)*(1+x(it_, 2))*params(5)*y(41)));
g1(8,7)=T(7)*(-T(4))/(y(7)*y(7))+T(4)/y(7)*1/y(26)*T(20);
g1(8,12)=(-(y(24)*(1+x(it_, 2))*x(it_, 3)*params(5)*y(41)*params(8)));
g1(8,16)=1;
g1(8,41)=(-(y(24)*y(12)*params(8)*(1+x(it_, 2))*x(it_, 3)*params(5)));
g1(8,24)=(-(y(12)*(1+x(it_, 2))*x(it_, 3)*params(5)*y(41)*params(8)));
g1(8,26)=T(4)/y(7)*T(20)*(-y(7))/(y(26)*y(26));
g1(8,47)=(-(y(24)*y(12)*x(it_, 3)*params(5)*y(41)*params(8)));
g1(8,48)=(-(y(24)*y(12)*params(8)*(1+x(it_, 2))*params(5)*y(41)));
g1(9,8)=T(8)*(-T(2))/(y(8)*y(8))+T(2)/y(8)*1/y(27)*T(21);
g1(9,16)=1;
g1(9,27)=T(2)/y(8)*T(21)*(-y(8))/(y(27)*y(27));
g1(10,8)=T(9)*(-T(4))/(y(8)*y(8))+T(4)/y(8)*1/y(28)*T(22);
g1(10,16)=1;
g1(10,28)=T(4)/y(8)*T(22)*(-y(8))/(y(28)*y(28));
g1(11,9)=(-params(3));
g1(11,16)=(-params(4));
g1(12,10)=(-params(3));
g1(12,16)=(-params(4));
g1(13,11)=(-params(3));
g1(13,16)=(-params(4));
g1(14,9)=(-(params(4)*y(16)));
g1(14,13)=(-(params(5)*(1+x(it_, 2))*x(it_, 3)*y(41)*y(32)));
g1(14,16)=y(29)-params(4)*y(9);
g1(14,17)=1;
g1(14,40)=(-params(5));
g1(14,41)=(-(params(5)*y(32)*y(13)*x(it_, 3)*(1+x(it_, 2))));
g1(14,20)=1;
g1(14,29)=y(16);
g1(14,32)=(-(params(5)*y(13)*(1+x(it_, 2))*x(it_, 3)*y(41)));
g1(14,47)=(-(params(5)*y(32)*y(13)*x(it_, 3)*y(41)));
g1(14,48)=(-(params(5)*y(32)*y(13)*(1+x(it_, 2))*y(41)));
g1(15,10)=(-(params(4)*y(16)));
g1(15,12)=(-(params(5)*(1+x(it_, 2))*x(it_, 3)*y(41)*y(32)));
g1(15,16)=y(30)-params(4)*y(10);
g1(15,17)=1;
g1(15,40)=(-((1-params(1)-params(2))*params(5)));
g1(15,18)=1;
g1(15,41)=(-(params(5)*(1-params(1)-params(2)+y(32)*y(12)*x(it_, 3)*(1+x(it_, 2)))));
g1(15,42)=(-(params(1)*params(5)));
g1(15,21)=1;
g1(15,30)=y(16);
g1(15,32)=(-(params(5)*y(12)*(1+x(it_, 2))*x(it_, 3)*y(41)));
g1(15,47)=(-(params(5)*y(32)*y(12)*x(it_, 3)*y(41)));
g1(15,48)=(-(params(5)*y(32)*y(12)*(1+x(it_, 2))*y(41)));
g1(16,11)=(-(params(4)*y(16)));
g1(16,16)=y(31)-params(4)*y(11);
g1(16,19)=1;
g1(16,42)=(-params(5));
g1(16,22)=1;
g1(16,31)=y(16);
g1(17,6)=(-(1/y(6)));
g1(17,9)=T(10)*2*y(9);
g1(17,20)=1;
g1(18,7)=(-(1/y(7)));
g1(18,10)=T(10)*2*y(10);
g1(18,21)=1;
g1(19,8)=(-(1/y(8)));
g1(19,11)=T(10)*2*y(11);
g1(19,22)=1;
g1(20,6)=1;
g1(20,23)=(-(T(2)*getPowerDeriv(y(23),1-T(1),1)*T(23)));
g1(20,24)=(-(T(23)*T(4)*getPowerDeriv(y(24),1-T(1),1)));
g1(21,7)=1;
g1(21,25)=(-(T(2)*getPowerDeriv(y(25),1-T(1),1)*T(24)));
g1(21,26)=(-(T(24)*T(4)*getPowerDeriv(y(26),1-T(1),1)));
g1(22,8)=1;
g1(22,27)=(-(T(2)*getPowerDeriv(y(27),1-T(1),1)*T(25)));
g1(22,28)=(-(T(25)*T(4)*getPowerDeriv(y(28),1-T(1),1)));
g1(23,23)=(-1);
g1(23,24)=(-1);
g1(23,29)=1;
g1(24,25)=(-1);
g1(24,26)=(-1);
g1(24,30)=1;
g1(25,27)=(-1);
g1(25,28)=(-1);
g1(25,31)=1;
g1(26,23)=(-(params(7)*y(25)));
g1(26,24)=(-(params(8)*y(26)));
g1(26,25)=(-(y(23)*params(7)));
g1(26,26)=(-(y(24)*params(8)));
g1(26,32)=1;
g1(27,2)=(-params(2));
g1(27,4)=(-1);
g1(27,15)=1;
g1(28,6)=(-(y(12)/T(16)));
g1(28,7)=(-(y(13)/T(16)));
g1(28,8)=(-(y(14)/T(16)));
g1(28,12)=(-(y(6)/T(16)));
g1(28,13)=(-(y(7)/T(16)));
g1(28,14)=(-(y(8)/T(16)));
g1(28,33)=1;
g1(29,12)=(-(y(29)/T(16)));
g1(29,13)=(-(y(30)/T(16)));
g1(29,14)=(-(y(31)/T(16)));
g1(29,29)=(-(y(12)/T(16)));
g1(29,30)=(-(y(13)/T(16)));
g1(29,31)=(-(y(14)/T(16)));
g1(29,34)=1;
g1(30,9)=(-(y(12)*T(15)));
g1(30,10)=(-(y(13)*T(15)));
g1(30,11)=(-(y(14)*T(15)));
g1(30,12)=(-(y(9)*T(15)));
g1(30,13)=(-(y(10)*T(15)));
g1(30,14)=(-(y(11)*T(15)));
g1(30,35)=1;
g1(31,20)=(-1);
g1(31,36)=1;
g1(31,43)=(-params(5));
g1(32,21)=(-1);
g1(32,37)=1;
g1(32,44)=(-params(5));
g1(33,22)=(-1);
g1(33,38)=1;
g1(33,45)=(-params(5));
g1(34,12)=(-y(36));
g1(34,13)=(-y(37));
g1(34,14)=(-y(38));
g1(34,36)=(-y(12));
g1(34,37)=(-y(13));
g1(34,38)=(-y(14));
g1(34,39)=1;

end
