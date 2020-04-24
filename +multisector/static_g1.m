function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = multisector.static_g1_tt(T, y, x, params);
end
g1 = zeros(19, 19);
g1(1,1)=(-(params(6)/params(7)));
g1(1,2)=T(3)*T(2)*(-1)/(y(2)*y(2))+T(2)*1/y(2)*1/y(16)*T(10);
g1(1,3)=(-(params(7)*params(1)*y(5)*params(9)/T(4)));
g1(1,5)=(-(params(7)*params(9)*params(1)*y(3)/T(4)));
g1(1,16)=T(2)*1/y(2)*T(10)*(-y(2))/(y(16)*y(16));
g1(2,16)=(-(((y(16))-y(16))/((y(16))*(y(16)))));
g1(2,17)=1;
g1(3,1)=(-(params(6)/params(7)));
g1(3,2)=T(6)*T(5)*(-1)/(y(2)*y(2))+1/y(2)*T(5)*1/y(18)*T(11);
g1(3,3)=(-(params(7)*params(1)*y(5)*params(11)/T(4)));
g1(3,5)=(-(params(7)*params(11)*params(1)*y(3)/T(4)));
g1(3,18)=1/y(2)*T(5)*T(11)*(-y(2))/(y(18)*y(18));
g1(4,18)=(-(((y(18))-y(18))/((y(18))*(y(18)))));
g1(4,19)=1;
g1(5,1)=(-params(7));
g1(5,16)=1;
g1(5,18)=1;
g1(6,2)=1;
g1(6,16)=(-(T(2)*getPowerDeriv(y(16),1-T(1),1)*T(12)));
g1(6,18)=(-(T(12)*T(5)*getPowerDeriv(y(18),1-T(1),1)));
g1(7,4)=1;
g1(7,5)=(-(params(2)+params(1)*T(8)*(y(16)*params(9)+y(18)*params(11))));
g1(7,16)=(-(params(9)*y(5)*params(1)*T(8)));
g1(7,18)=(-(params(11)*y(5)*params(1)*T(8)));
g1(8,3)=1;
g1(8,13)=params(8);
g1(8,14)=(-params(8));
g1(9,13)=1-params(8)*(1-params(4)-params(3));
g1(9,15)=(-(params(8)*params(3)));
g1(10,15)=1-params(8);
g1(11,1)=params(6)/2*2*y(1);
g1(11,2)=(-(1/y(2)));
g1(11,4)=(-(params(8)*(y(13)-y(14))));
g1(11,13)=(-(y(4)*params(8)));
g1(11,14)=1-params(8)*(1-y(4));
g1(12,4)=(-y(7));
g1(12,6)=1;
g1(12,7)=(-y(4));
g1(13,5)=1-(1-params(3)-params(4));
g1(14,5)=1-(1-params(3)-params(4));
g1(14,6)=(-1);
g1(15,5)=(-params(3));
g1(16,5)=(-params(4));
g1(17,2)=(-(y(7)/T(8)));
g1(17,5)=(-1);
g1(17,7)=(-(y(2)/T(8)));
g1(17,8)=(-1);
g1(17,10)=1;
g1(18,1)=(-(T(4)*y(7)));
g1(18,5)=(-1);
g1(18,7)=(-(y(1)*T(4)));
g1(18,8)=(-1);
g1(18,12)=1;
g1(19,5)=(-1);
g1(19,7)=(-((y(16)+y(18))/T(8)));
g1(19,8)=(-1);
g1(19,11)=1;
g1(19,16)=(-(y(7)/T(8)));
g1(19,18)=(-(y(7)/T(8)));
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
