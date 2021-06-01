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
    T = kuxmain.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(22, 34);
g1(1,6)=(-(params(3)/params(4)));
g1(1,7)=T(6)*T(17)+T(4)*T(18)*T(19);
g1(1,8)=(-(params(4)*params(6)*T(7)/T(8)));
g1(1,10)=(-(params(4)*params(6)*y(8)*x(it_, 1)*(1+x(it_, 3))/params(10)/T(8)));
g1(1,21)=T(4)*T(19)*(-y(7))/(y(21)*y(21));
g1(1,31)=(-(params(4)*params(6)*y(8)*(1+x(it_, 3))*y(10)/params(10)/T(8)));
g1(1,33)=(-(params(4)*params(6)*y(8)*x(it_, 1)*y(10)/params(10)/T(8)));
g1(2,21)=(-(1/(steady_state(16))));
g1(2,22)=1;
g1(3,6)=(-(params(3)/params(4)));
g1(3,7)=T(9)*T(17)+T(4)*T(20)*T(21);
g1(3,8)=(-(params(4)*T(3)*T(7)/T(8)));
g1(3,10)=(-(params(4)*T(3)*y(8)*x(it_, 1)*(1+x(it_, 3))/params(10)/T(8)));
g1(3,23)=T(4)*T(21)*(-y(7))/(y(23)*y(23));
g1(3,31)=(-(params(4)*T(3)*y(8)*(1+x(it_, 3))*y(10)/params(10)/T(8)));
g1(3,33)=(-(params(4)*T(3)*y(8)*x(it_, 1)*y(10)/params(10)/T(8)));
g1(4,23)=(-(1/(steady_state(18))));
g1(4,24)=1;
g1(5,6)=(-params(4));
g1(5,21)=params(7);
g1(5,23)=1-params(7);
g1(6,7)=1;
g1(6,21)=(-(T(25)*T(26)));
g1(6,23)=(-(T(26)*T(27)));
g1(7,9)=1;
g1(7,10)=(-(params(1)/params(10)+T(15)*T(22)));
g1(7,21)=(-(params(7)*params(6)*T(11)));
g1(7,23)=(-((1-params(7)*params(6))*T(11)));
g1(7,31)=(-(T(15)*T(28)));
g1(7,33)=(-(T(15)*y(10)*x(it_, 1)*T(10)/params(10)));
g1(8,8)=1;
g1(8,28)=(-((-params(5))*(1-x(it_, 4))));
g1(8,29)=(-(params(5)*(1-x(it_, 4))));
g1(8,34)=(-params(5))*(y(28)-y(29));
g1(9,18)=1;
g1(9,28)=(-(params(5)*(1-T(1)-T(2))));
g1(9,30)=(-(T(2)*params(5)));
g1(10,20)=1;
g1(10,30)=(-params(5));
g1(11,6)=params(3)/2*2*y(6);
g1(11,7)=(-T(4));
g1(11,9)=(-(params(5)*(y(28)-y(29))*(1-x(it_, 4))));
g1(11,28)=(-(params(5)*y(9)*(1-x(it_, 4))));
g1(11,19)=1;
g1(11,29)=(-(params(5)*(x(it_, 4)+(1-x(it_, 4))*(1-y(9)))));
g1(11,34)=(-(params(5)*(y(29)-(y(29)*(1-y(9))+y(9)*y(28)))));
g1(12,9)=(-y(12));
g1(12,11)=1;
g1(12,12)=(-y(9));
g1(13,1)=(-(1-T(2)-T(1)));
g1(13,10)=1;
g1(13,3)=(-1);
g1(13,12)=1;
g1(14,1)=(-(1-T(2)-T(1)));
g1(14,10)=1;
g1(14,2)=(-1);
g1(14,32)=(-1);
g1(15,1)=(-T(2));
g1(15,4)=(-1);
g1(15,13)=1;
g1(16,1)=(-T(1));
g1(16,5)=(-1);
g1(16,14)=1;
g1(17,5)=1;
g1(17,14)=(-1);
g1(17,15)=1;
g1(18,7)=(-(T(13)/T(10)));
g1(18,10)=T(24);
g1(18,12)=(-(y(7)*T(23)/T(10)));
g1(18,13)=T(24);
g1(18,16)=1;
g1(19,6)=(-(T(8)*T(13)));
g1(19,10)=(-T(23));
g1(19,12)=(-(T(8)*y(6)*T(23)));
g1(19,13)=(-T(23));
g1(19,17)=1;
g1(20,21)=(-0.5);
g1(20,23)=(-0.5);
g1(20,25)=1;
g1(21,21)=(-(params(6)*0.5/y(25)));
g1(21,23)=(-(T(3)*0.5/y(25)));
g1(21,25)=(-((-(0.5*(params(6)*y(21)+T(3)*y(23))))/(y(25)*y(25))));
g1(21,26)=1;
g1(22,25)=(-(1/T(10)));
g1(22,27)=1;

end
