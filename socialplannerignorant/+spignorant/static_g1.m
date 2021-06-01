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
    T = spignorant.static_g1_tt(T, y, x, params);
end
g1 = zeros(20, 20);
g1(1,2)=(-params(4));
g1(1,14)=1;
g1(2,4)=(-(1-params(1)-params(2)-1));
g1(3,3)=(-(y(4)*x(3)*(1+x(2))*y(15)));
g1(3,4)=1-(1-params(1)-params(2)+y(15)*y(3)*x(3)*(1+x(2)));
g1(3,15)=(-(y(3)*y(4)*x(3)*(1+x(2))));
g1(4,4)=(-params(1));
g1(5,1)=T(3)*(-T(2))/(y(1)*y(1))+T(2)/y(1)*1/y(12)*T(8);
g1(5,4)=(-(y(12)*(1+x(2))*x(3)*params(5)*y(9)*params(7)));
g1(5,7)=1;
g1(5,9)=(-(y(12)*y(4)*params(7)*(1+x(2))*x(3)*params(5)));
g1(5,12)=T(2)/y(1)*T(8)*(-y(1))/(y(12)*y(12))-y(4)*(1+x(2))*x(3)*params(5)*y(9)*params(7);
g1(6,1)=T(5)*(-T(4))/(y(1)*y(1))+T(4)/y(1)*1/y(13)*T(9);
g1(6,4)=(-(y(13)*(1+x(2))*x(3)*params(5)*y(9)*params(8)));
g1(6,7)=1;
g1(6,9)=(-(y(13)*y(4)*params(8)*(1+x(2))*x(3)*params(5)));
g1(6,13)=T(4)/y(1)*T(9)*(-y(1))/(y(13)*y(13))-y(4)*(1+x(2))*x(3)*params(5)*y(9)*params(8);
g1(7,2)=(-params(3));
g1(7,7)=(-params(4));
g1(8,4)=(-(params(5)*y(15)*(1+x(2))*x(3)*y(9)));
g1(8,8)=1-params(5);
g1(8,9)=(-(params(5)*y(4)*x(3)*(1+x(2))*y(15)));
g1(8,11)=1;
g1(8,15)=(-(params(5)*y(4)*(1+x(2))*x(3)*y(9)));
g1(9,3)=(-(params(5)*y(15)*(1+x(2))*x(3)*y(9)));
g1(9,8)=(-((1-params(1)-params(2))*params(5)-1));
g1(9,9)=1-params(5)*(1-params(1)-params(2)+y(15)*y(3)*x(3)*(1+x(2)));
g1(9,10)=(-(params(1)*params(5)));
g1(9,11)=1;
g1(9,15)=(-(params(5)*y(3)*(1+x(2))*x(3)*y(9)));
g1(10,10)=1-params(5);
g1(10,11)=1;
g1(11,1)=(-(1/y(1)));
g1(11,2)=params(3)/2*2*y(2);
g1(11,11)=1;
g1(12,1)=1;
g1(12,12)=(-(T(2)*getPowerDeriv(y(12),1-T(1),1)*T(10)));
g1(12,13)=(-(T(10)*T(4)*getPowerDeriv(y(13),1-T(1),1)));
g1(13,12)=(-1);
g1(13,13)=(-1);
g1(13,14)=1;
g1(14,12)=(-(y(12)*params(7)+y(12)*params(7)));
g1(14,13)=(-(y(13)*params(8)+y(13)*params(8)));
g1(14,15)=1;
g1(15,4)=(-params(2));
g1(16,1)=(-((y(5)+y(3)+y(4))/T(7)));
g1(16,3)=(-(y(1)/T(7)));
g1(16,4)=(-(y(1)/T(7)));
g1(16,5)=(-(y(1)/T(7)));
g1(16,16)=1;
g1(17,3)=(-(y(14)/T(7)));
g1(17,4)=(-(y(14)/T(7)));
g1(17,5)=(-(y(14)/T(7)));
g1(17,14)=(-((y(5)+y(3)+y(4))/T(7)));
g1(17,17)=1;
g1(18,2)=(-(sqrt(params(3))*(y(5)+y(3)+y(4))));
g1(18,3)=(-(y(2)*sqrt(params(3))));
g1(18,4)=(-(y(2)*sqrt(params(3))));
g1(18,5)=(-(y(2)*sqrt(params(3))));
g1(18,18)=1;
g1(19,11)=(-1);
g1(19,19)=1-params(5);
g1(20,3)=(-y(19));
g1(20,4)=(-y(19));
g1(20,5)=(-y(19));
g1(20,19)=(-(y(5)+y(3)+y(4)));
g1(20,20)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
