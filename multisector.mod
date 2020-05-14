// This file replicates the model studied in:
// Krueger, Dirk, Harald Uhlig, and Taojun Xie (2020): "Macroeconomic 
// Dynamics and Reallocation in an Epidemic", NBER Working Paper 27047.

@#define find_init_9sector      = 0
@#define periods                = 500
@#define phi1                   = 0.2
@#define pi_a                   = 0 // 0.34

// Specify the number of sectors, K, in odd numbers 

@#if find_init_9sector == 1
    @#define K = 9
@#else
    @#define K = 2
@#endif

@#if pi_a == 0
    @#define pi_s = 4.05e-7
@#else
    @#define pi_s = 1.77e-7
@#endif

clc;

var         n           (long_name = 'Labor supply')
            c           (long_name = 'Agg. consumption')
            lambda_tau  (long_name = 'Lambda')
            tau         (long_name = 'Probability of infection')
            I           (long_name = 'Infected')
            T           (long_name = 'Newly infected')
            S           (long_name = 'Susceptible')
            R           (long_name = 'Recovered')
            D           (long_name = 'Deceased')
            C           (long_name = 'Agg. consumption')
            N           (long_name = 'Agg. labor')
            Ui          (long_name = 'Lifetime utility of infected')
            Us          (long_name = 'Lifetime utility of susceptible')
            Ur          (long_name = 'Lifetime utility of recovered')

            @#for k in 1:K
                c@{k} 
                c@{k}_dev
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

eta     = 10;
pi_s    = @{pi_s};
pi_a    = @{pi_a};
pi_d    = 7*0.005/18;
pi_r    = 7/18 - pi_d;
betta   = 0.96^(1/52);
A       = 39.835;
theta   = 0.001275;

@#if K != 2
    @#for k in 1:K
        phi@{k} = 1/((@{K}+1)/2)*@{k};
        ups@{k} = 1/@{K};
    @#endfor
@#endif

@#if K == 2
    phi1 = @{phi1};
    ups1 = 0.5;
    ups2 = 0.5;
    phi2 = 2 - phi1;
@#endif

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

C = (S * c + (I + R) * A / sqrt(theta))/(A/sqrt(theta)) - 1;

N = (S * n + (I + R) * 1 / sqrt(theta))/(1/sqrt(theta)) - 1;

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
    c@{k}_dev = 0;
@#endfor

end;

steady;
check;
//model_diagnostics;

shocks;
    var     eps;
    periods 1:1;
    values  0.001;
end;

perfect_foresight_setup(periods = @{periods});

//
// SIMULATIONS
//

@#for value in 1e-9:2e-9:pi_s
    clc;
    pi_s = @{value};
    disp(['pi_s = ' num2str(pi_s)]);
    perfect_foresight_solver(stack_solve_algo=6);
@#endfor

varmat = [I S R D C N];
titles = {  'Infected', 'Susceptible', 'Recovered',...    
             'Deceased', 'Agg. cons.', 'Agg. labor'};
figure;
for x = 1:size(varmat,2)
    subplot(2,3,x);
    plot(0:150, 100.*varmat(2:152, x), 'color', [0 0 1], 'linewidth', 2);
    title(titles{x});
    if x > 3
        xlabel('Weeks');
    end
end

clean_current_folder;