function [ys_, params, info] = steadystate(ys_, exo_, params)
% Steady state generated by Dynare preprocessor
    info = 0;
    ys_(4)=0;
    ys_(5)=0;
    ys_(6)=0;
    ys_(8)=0;
    ys_(9)=0;
    ys_(10)=0;
    C_sum=0;
    ys_(11)=0;
    ys_(1)=1/sqrt(params(6));
    lambda_b=ys_(1)*params(6)/params(7);
    ys_(2)=ys_(1)*params(7);
    ys_(13)=(log(ys_(2))-params(6)/2*ys_(1)^2)/(1-params(8));
    ys_(14)=ys_(13);
    ys_(12)=(log(ys_(2))-params(6)/2*ys_(1)^2+ys_(14)*params(8)*params(3))/(1-params(8)*(1-params(4)-params(3)));
    ys_(3)=params(8)*(ys_(13)-ys_(12));
    ys_(7)=1;
    ys_(15)=0;
    ys_(16)=ys_(2)*params(10);
    ys_(17)=0;
    ys_(18)=ys_(2)*params(12);
    ys_(19)=0;
    % Auxiliary equations
end
