// This file replicates the model studied in:
// Krueger, Dirk, Harald Uhlig, and Taojun Xie (2020): "Macroeconomic 
// Dynamics and Reallocation in an Epidemic", NBER Working Paper 27047.

@#define find_init_9sector      = 0
@#define periods                = 100
@#define phi1                   = 0.2
@#define pi_a                   = 0 // 0.34
@#define kappa                  = 10
@#define alpha                  = .001

// Homogeneous vs heterogeneous sectors

// Autonomous infection
@#if pi_a == 0
    @#define pi_s = 1.82e-6
@#else
    @#define pi_s = 1.77e-7
@#endif

// Nine-sector scenario 
@#if find_init_9sector == 1
    @#define K = 9
@#else
    @#define K = 2
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
            dD          (long_name = 'Weekly death')

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

eta     = 3;
pi_s    = @{pi_s};
pi_a    = @{pi_a};
pi_d    = 7*@{alpha}/@{kappa};
pi_r    = 7*(1-@{alpha})/@{kappa};
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

@#include "ModelEquations.mod"

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
dD          = 0;
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
    values  0.0001;
end;

perfect_foresight_setup(periods = @{periods});

//
// SIMULATIONS
//

@#for value in 1e-7:2e-8:pi_s
    clc;
    pi_s = @{value};
    disp(['pi_s = ' num2str(pi_s)]);
    perfect_foresight_solver(stack_solve_algo=6);
@#endfor

@#if pi_a != 0 
    clc;
    @#for value in 0:1e-2:(pi_a+1e-10)
        clc;
        pi_a = @{value};
        disp(['pi_a = ' num2str(pi_a)]);
        perfect_foresight_solver(stack_solve_algo=6);
    @#endfor
@#endif

PlotResults;

clean_current_folder;