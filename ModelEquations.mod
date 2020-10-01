model;

@#for k in 1:K
    [name = 'FOC sector @{k}']
    ups@{k}^(1/eta) * (1 / c) * (c / c@{k})^(1 / eta) 
        = theta / A * n + @{K} * pi_s * I * lambda_tau * phi@{k} * ups@{k} * A / sqrt(theta);
    
    c@{k}_dev = (c@{k}/steady_state(c@{k}) - 1);
@#endfor

@#for k in 1:K
    + c@{k}
@#endfor
 = A*n;

c = (
@#for k in 1:K
    +ups@{k}^(1/eta) * c@{k}^(1 - 1/eta)
@#endfor
)^(eta/(eta - 1));

tau = A / sqrt(theta) * @{K} * pi_s * I * (
@#for k in 1:K
    + phi@{k}*c@{k}*ups@{k}
@#endfor
) + pi_a * I;

lambda_tau = -betta * (Ui(1) - Us(1));

Ui = log(A/sqrt(theta)) - theta/2*(1/sqrt(theta))^2 
        + betta*((1 - pi_d - pi_r) * Ui(1) + pi_r * Ur(1));

Ur = log(A/sqrt(theta)) - theta/2*(1/sqrt(theta))^2 + betta*Ur(1);

Us = log(c) - theta/2*n^2 + betta*((1 - tau)*Us(1) + tau*Ui(1));

T = S * tau;

S - S(-1) + I - (1 - pi_r - pi_d) * I(-1) = 0;

I = T(-1) + (1 - pi_r - pi_d) * I(-1) + eps;

R = R(-1) + pi_r*I(-1);

D = D(-1) + pi_d*I(-1);

dD = D - D(-1);

C = (S * c + (I + R) * A / sqrt(theta))/(A/sqrt(theta)) - 1;

N = (S * n + (I + R) * 1 / sqrt(theta))/(1/sqrt(theta)) - 1;

end;
