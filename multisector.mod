@#define model_check = 0

// Specify the number of sectors, K, in odd numbers

@#define K = 2

var         n           (long_name = 'Labor supply')
            c           (long_name = 'Agg. consumption')
            lambda_tau  (long_name = 'Lambda')
            tau         
            I           (long_name = 'Infected')
            T           (long_name = 'Newly infected')
            S           (long_name = 'Susceptible')
            R           (long_name = 'Recovered')
            D           (long_name = 'Deceased')
            C           (long_name = 'Agg. consumption')
            C_sum       (long_name = 'Agg. consumption')
            N           (long_name = 'Agg. labor')
            Ui          
            Us 
            Ur

            @#for k in 1:K
                c@{k} c@{k}_dev
            @#endfor
            ;

parameters  pi_s        ${\pi_s}$   (long_name = 'Probability of becoming infected')
            pi_a        ${\pi_a}$   (long_name = 'Probability of autonomous infection')
            pi_r        ${\pi_r}$   (long_name = 'Probability of recovery')
            pi_d        ${\pi_d}$   (long_name = 'Probability of death')
            eta         ${\eta}$    (long_name = 'Dlasticity of substitution')
            theta       ${\theta}$  (long_name = 'Labor supply parameter')
            A           ${A}$       (long_name = 'Productivity')
            betta       ${\beta}$   (long_name = 'Discount factor')

            @#for k in 1:K
                phi@{k} ${\phi_{@{k}}}$
                ups@{k} ${\upsilon_{@{k}}}$
            @#endfor
            ;

varexo      eps
            ;

set_param_value('eta',      eta);
set_param_value('pi_s',     pi_s);
set_param_value('pi_a',     pi_a);
set_param_value('pi_d',     pi_d);
set_param_value('pi_r',     pi_r);
set_param_value('betta',    betta);
set_param_value('A',        A);
set_param_value('theta',    theta);

@#if K != 2
    @#for k in 1:K
        phi@{k} = 1/((@{K}+1)/2)*@{k};
        ups@{k} = 1/@{K};
    @#endfor
@#endif

@#if K == 2
    set_param_value('phi1', phi1);
    set_param_value('ups1', ups1);
    set_param_value('phi2', phi2);
    set_param_value('ups2', ups2);
@#endif


model;

@#for k in 1:K
    [name = 'FOC sector @{k}']
    ups@{k}^(1/eta) * (1 / c) * (c / c@{k})^(1 / eta) 
        = theta / A * n + pi_s * I * lambda_tau * phi@{k} * A / sqrt(theta);

    [name = 'Deviation @{k}']
    c@{k}_dev = (c@{k}/steady_state(c@{k}) - 1);
@#endfor

[name = 'Budget']
@#for k in 1:K
    + c@{k}
@#endfor
 = A*n;

[name = 'c']
c = (
@#for k in 1:K
    +ups@{k}^(1/eta) * c@{k}^(1 - 1/eta)
@#endfor
)^(eta/(eta - 1));

[name = 'tau']
tau = A / sqrt(theta) * pi_s * I * (
@#for k in 1:K
    + phi@{k}*c@{k}
@#endfor
) + pi_a * I;

[name = 'lambda_tau']
lambda_tau = -betta * (Ui(1) - Us(1));

[name = 'Ui']
Ui = log(A/sqrt(theta)) - theta/2*(1/sqrt(theta))^2 
        + betta*((1 - pi_d - pi_r) * Ui(1) + pi_r * Ur(1));

[name = 'Ur']
Ur = log(A/sqrt(theta)) - theta/2*(1/sqrt(theta))^2 + betta*Ur(1);

[name = 'Us']
Us = log(c) - theta/2*n^2 + betta*((1 - tau)*Us(1) + tau*Ui(1));

[name = 'T']
T = S * tau;

[name = 'S']
S - S(-1) + I - (1 - pi_r - pi_d) * I(-1) = 0;

[name = 'I']
I = T(-1) + (1 - pi_r - pi_d) * I(-1) + eps;

R = R(-1) + pi_r*I(-1);

D = D(-1) + pi_d*I(-1);

C = (S * c + (I + R) * A / sqrt(theta))/(A/sqrt(theta)) - 1;

N = (S * n + (I + R) * 1 / sqrt(theta))/(1/sqrt(theta)) - 1;

C_sum = (S * (c1 + c2) + (I + R) * A / sqrt(theta))/(A/sqrt(theta)) - 1;

end;


steady_state_model;

tau         = 0;
I           = 0;
T           = 0;
R           = 0;
D           = 0;
C           = 0;
C_sum       = 0;
N           = 0;
c1_dev      = 0;
c2_dev      = 0;
n           = 1/sqrt(theta);
lambda_b    = theta/A*n;
c           = A*n;
Us          = (log(c)-theta/2*n^2)/(1-betta);
Ur          = Us;
Ui          = (log(c)-theta/2*n^2+betta*pi_r*Ur)/(1-betta*(1-pi_d-pi_r));
lambda_tau  = betta * (Us - Ui);
S           = 1;
@#for k in 1:K
    c@{k}   = ups@{k} * c;
@#endfor

end;

steady;
//check;
//model_diagnostics;

shocks;
    var     eps;
    periods 1:1;
    values  0.001;
end;

perfect_foresight_setup(periods = 5000);

@#if model_check == 0

load('init.mat');

//perfect_foresight_solver(stack_solve_algo=7, solve_algo=4, maxit=100000);
perfect_foresight_solver(stack_solve_algo=6);
//save('init.mat', 'oo_');
@#endif
//write_latex_parameter_table;
clean_current_folder;