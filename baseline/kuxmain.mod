// This file replicates the model studied in:
// Krueger, Dirk, Harald Uhlig, and Taojun Xie (2020): "Macroeconomic 
// Dynamics and Reallocation in an Epidemic", NBER Working Paper 27047.

@#define K = 2

var         n           (long_name = 'Labor supply')
            c           (long_name = 'Agg. consumption')
            lambda_tau  (long_name = 'Lambda')
            tau         (long_name = 'Probability of infection')
            I           (long_name = 'Infected')
            T           (long_name = 'Newly infected')
            S           (long_name = 'Susceptible')
            R           (long_name = 'Recovered')
            D           (long_name = 'Deceased')
            dD          (long_name = 'Weekly death')
            C           (long_name = 'Agg. consumption')
            N           (long_name = 'Agg. labor')
            Ui          (long_name = 'Lifetime utility of infected')
            Us          (long_name = 'Lifetime utility of susceptible')
            Ur          (long_name = 'Lifetime utility of recovered')

            @#for k in 1:K
                c@{k} 
                c@{k}_dev
            @#endfor
            ctilde kuxc ertc
            ;

parameters  //pi_s        ${\pi_s}$   (long_name = 'Probability of becoming infected')
            pi_a        ${\pi_a}$   (long_name = 'Probability of autonomous infection')
            eta         ${\eta}$    (long_name = 'Dlasticity of substitution')
            theta       ${\theta}$  (long_name = 'Labor supply parameter')
            A           ${A}$       (long_name = 'Productivity')
            betta       ${\beta}$   (long_name = 'Discount factor')
            phi1
            ups1
            alpha
            kappa
            pop
            ;

varexo      pi_s eps step SIR
            ;

alpha   = 1e-3;
kappa   = 7;
phi1    = 0.3;
//pi_s    = 0;
I0      = 1;
winter  = 0;
eta     = 3;
pi_a    = 0;
betta   = 0.96^(1/52);
A       = 39.835;
theta   = 0.001275;
ups1    = 0.5;
pop     = 1e5;

model;
#pi_d = 7*alpha/kappa;
#pi_r = 7*(1 - alpha)/kappa;
#ups2 = 1 - ups1;
#phi2 = (1 - phi1*ups1)/(1 - ups1);

@#for k in 1:K
    [name = 'FOC sector @{k}']
    (1 / c) * (c / c@{k})^(1 / eta) 
        = theta / A * n + pi_s * (1+step) * I/pop * lambda_tau * phi@{k} * A / sqrt(theta);
    
    c@{k}_dev = (c@{k}/steady_state(c@{k}) - 1);
@#endfor

@#for k in 1:K
    + ups@{k} * c@{k}
@#endfor
 = A*n;

c = (
@#for k in 1:K
    +ups@{k} * c@{k}^(1 - 1/eta)
@#endfor
)^(eta/(eta - 1));

tau = A / sqrt(theta) * pi_s * (1+step) * I/pop * (
@#for k in 1:K
    + phi@{k}*c@{k}*ups@{k}
@#endfor
) + pi_a * I/pop;

lambda_tau = -betta * (Ui(1) - Us(1)) * (1 - SIR);

Ui = log(A/sqrt(theta)) - theta/2*(1/sqrt(theta))^2 
        + betta*((1 - pi_d - pi_r) * Ui(1) + pi_r * Ur(1));

Ur = log(A/sqrt(theta)) - theta/2*(1/sqrt(theta))^2 + betta*Ur(1);

Us = log(c) - theta/2*n^2 + betta*(((1 - tau)*Us(1) + tau*Ui(1))*(1 - SIR) + SIR*Us(1));

T = S * tau;

S - S(-1) + I - (1 - pi_r - pi_d) * I(-1) = 0;

I = T(-1) + (1 - pi_r - pi_d) * I(-1) + eps;

R = R(-1) + pi_r*I(-1);

D = D(-1) + pi_d*I(-1);

dD = D - D(-1);

C = (S/pop * c + (I + R)/pop * A / sqrt(theta))/(A/sqrt(theta)) - 1;

N = (S/pop * n + (I + R)/pop * 1 / sqrt(theta))/(1/sqrt(theta)) - 1;

ctilde = 0.5*(c1 + c2);

kuxc = 0.5*(phi1*c1 + phi2*c2)/ctilde;

ertc = ctilde/(A / sqrt(theta));

end;


steady_state_model;

tau         = 0;
I           = 0;
T           = 0;
R           = 0;
D           = 0;
dD          = 0;
C           = 0;
C_sum       = 0;
N           = 0;
n           = 1/sqrt(theta);
lambda_b    = theta/A*n;
c           = A*n;
Us          = (log(c)-theta/2*n^2)/(1-betta);
Ur          = Us;
Ui          = (log(c)-theta/2*n^2+betta*7*(1 - alpha)/kappa*Ur)/(1-betta*(1-7/kappa));
lambda_tau  = betta * (Us - Ui);
S           = 1*pop;
@#for k in 1:K
    c@{k}   = c;
    c@{k}_dev = 0;
    c@{k}_dev_4weeks = 0;
@#endfor

ctilde = c;
ertc = 1;
kuxc = 1;

end;


steady;