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
    T = multisector.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(18, 27);
g1(1,6)=(-(params(6)/params(7)));
g1(1,7)=T(3)*T(2)*(-1)/(y(7)*y(7))+T(2)*1/y(7)*1/y(20)*T(10);
g1(1,8)=(-(params(7)*params(10)*2*params(1)*y(10)*params(9)/T(4)));
g1(1,10)=(-(params(7)*params(10)*params(9)*2*params(1)*y(8)/T(4)));
g1(1,20)=T(2)*1/y(7)*T(10)*(-y(7))/(y(20)*y(20));
g1(2,20)=(-(1/(steady_state(15))));
g1(2,21)=1;
g1(3,6)=(-(params(6)/params(7)));
g1(3,7)=T(6)*T(5)*(-1)/(y(7)*y(7))+1/y(7)*T(5)*1/y(22)*T(11);
g1(3,8)=(-(params(7)*params(12)*2*params(1)*y(10)*params(11)/T(4)));
g1(3,10)=(-(params(7)*params(12)*params(11)*2*params(1)*y(8)/T(4)));
g1(3,22)=1/y(7)*T(5)*T(11)*(-y(7))/(y(22)*y(22));
g1(4,22)=(-(1/(steady_state(17))));
g1(4,23)=1;
g1(5,6)=(-params(7));
g1(5,20)=1;
g1(5,22)=1;
g1(6,7)=1;
g1(6,20)=(-(T(2)*getPowerDeriv(y(20),1-T(1),1)*T(12)));
g1(6,22)=(-(T(12)*T(5)*getPowerDeriv(y(22),1-T(1),1)));
g1(7,9)=1;
g1(7,10)=(-(params(2)+params(1)*2*T(8)*(params(10)*y(20)*params(9)+params(12)*y(22)*params(11))));
g1(7,20)=(-(y(10)*params(1)*2*T(8)*params(10)*params(9)));
g1(7,22)=(-(y(10)*params(1)*2*T(8)*params(12)*params(11)));
g1(8,8)=1;
g1(8,24)=params(8);
g1(8,25)=(-params(8));
g1(9,17)=1;
g1(9,24)=(-(params(8)*(1-params(4)-params(3))));
g1(9,26)=(-(params(8)*params(3)));
g1(10,19)=1;
g1(10,26)=(-params(8));
g1(11,6)=params(6)/2*2*y(6);
g1(11,7)=(-(1/y(7)));
g1(11,9)=(-(params(8)*(y(24)-y(25))));
g1(11,24)=(-(y(9)*params(8)));
g1(11,18)=1;
g1(11,25)=(-(params(8)*(1-y(9))));
g1(12,9)=(-y(12));
g1(12,11)=1;
g1(12,12)=(-y(9));
g1(13,1)=(-(1-params(3)-params(4)));
g1(13,10)=1;
g1(13,3)=(-1);
g1(13,12)=1;
g1(14,1)=(-(1-params(3)-params(4)));
g1(14,10)=1;
g1(14,2)=(-1);
g1(14,27)=(-1);
g1(15,1)=(-params(3));
g1(15,4)=(-1);
g1(15,13)=1;
g1(16,1)=(-params(4));
g1(16,5)=(-1);
g1(16,14)=1;
g1(17,7)=(-(y(12)/T(8)));
g1(17,10)=(-1);
g1(17,12)=(-(y(7)/T(8)));
g1(17,13)=(-1);
g1(17,15)=1;
g1(18,6)=(-(T(4)*y(12)));
g1(18,10)=(-1);
g1(18,12)=(-(y(6)*T(4)));
g1(18,13)=(-1);
g1(18,16)=1;

end
