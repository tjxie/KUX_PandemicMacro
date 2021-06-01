@#define run_perfect_foresight = 1

var     cs      
        ci 
        cr 
        ns
        ni
        nr
        S       (long_name = 'Susceptible')
        I       (long_name = 'Infected')
        R       (long_name = 'Recovered')
        D       (long_name = 'Deceased')
        mu_f 
        mu_S 
        mu_I 
        mu_R
        us      (long_name = 'Period utility (S)')
        ui      (long_name = 'Period utility (I)')
        ur      (long_name = 'Period utility (R)')
        c1s 
        c2s 
        c1i 
        c2i 
        c1r 
        c2r 
        int_cks 
        int_cki 
        int_ckr 
        int_phi_cks_cki
        C       (long_name = 'Agg. consumption')
        C_sum   (long_name = 'Agg. consumption')
        N       (long_name = 'Agg. labor')
        Us Ui Ur welfare
        ;

parameters  pi_r 
            pi_d 
            theta 
            A 
            betta 
            eta 
            phi1 
            phi2 
            ups1 
            ups2
            ;

varexo eps step pi_s;

set_param_value('eta',      3);
//set_param_value('pi_s',     1.48e-6);
set_param_value('pi_d',     7*0.002/14);
set_param_value('pi_r',     7*(1-0.002)/14);
set_param_value('theta',    .001275);
set_param_value('betta',    0.96^(1/52));
set_param_value('A',        39.835);

set_param_value('phi1',     0.6);
set_param_value('ups1',     .5);
set_param_value('ups2',     .5);
set_param_value('phi2',     1.4);

model;

// Constraints

[name = 'feasibility']
S * int_cks + I * int_cki + R * int_ckr = A * (S * ns + I * ni + R * nr);

[name = 'S']
S = S(-1) - I + (1 - pi_r - pi_d) * I(-1);

[name = 'I']
I = pi_s * (1+step) * I(-1) * S(-1) * int_phi_cks_cki(-1) + (1 - pi_r - pi_d) * I(-1) + eps;

[name = 'R']
R = R(-1) + pi_r * I(-1);

[name = 'FOC cs']
ups1^(1/eta) * 1/cs * (cs/c1s)^(1/eta) + mu_f = betta * mu_I(1) * pi_s * (1+step) * phi1 * I * c1i;
ups2^(1/eta) * 1/cs * (cs/c2s)^(1/eta) + mu_f = betta * mu_I(1) * pi_s * (1+step) * phi2 * I * c2i;

[name = 'FOC ci']
ups1^(1/eta) * 1/ci * (ci/c1i)^(1/eta) + mu_f = betta * mu_I(1) * pi_s * (1+step) * phi1 * S * c1s;
ups2^(1/eta) * 1/ci * (ci/c2i)^(1/eta) + mu_f = betta * mu_I(1) * pi_s * (1+step)* phi2 * S * c2s;

[name = 'FOC cr']
ups1^(1/eta) * 1/cr * (cr/c1r)^(1/eta) + mu_f = 0;
ups2^(1/eta) * 1/cr * (cr/c2r)^(1/eta) + mu_f = 0;

[name = 'FOC n']
-theta * ns = mu_f * A;
-theta * ni = mu_f * A;
-theta * nr = mu_f * A;

[name = 'FOC S']
us + mu_f * int_cks + mu_S = mu_f * A * ns + betta * (mu_S(1) + mu_I(1) * pi_s * (1+step) * I * int_phi_cks_cki);

[name = 'FOC I']
ui + mu_f * int_cki + mu_I = mu_f * A * ni - mu_S + betta * ( (mu_S(1) + mu_I(1)) * (1 - pi_r - pi_d) + mu_I(1) * pi_s * (1+step) * S * int_phi_cks_cki  + mu_R(1) * pi_r);

[name = 'FOC R']
ur + mu_f * int_ckr + mu_R = mu_f * A * nr + betta * mu_R(1);

[name = 'us']
us = log(cs) - theta/2*ns^2;

[name = 'ui']
ui = log(ci) - theta/2*ni^2;

[name = 'ur']
ur = log(cr) - theta/2*nr^2;

[name = 'aggregation']
cs = (ups1^(1/eta) * c1s^(1 - 1/eta) + ups2^(1/eta) * c2s^(1 - 1/eta))^(eta/(eta - 1));
ci = (ups1^(1/eta) * c1i^(1 - 1/eta) + ups2^(1/eta) * c2i^(1 - 1/eta))^(eta/(eta - 1));
cr = (ups1^(1/eta) * c1r^(1 - 1/eta) + ups2^(1/eta) * c2r^(1 - 1/eta))^(eta/(eta - 1));

[name = 'integral']
int_cks = c1s + c2s;
int_cki = c1i + c2i;
int_ckr = c1r + c2r;

[name = 'integral in tau']
int_phi_cks_cki = phi1 * c1s * c1i + phi2 * c2s * c2i;

D = D(-1) + pi_d * I(-1);

C = (S * cs + I * ci + R * cr)/(A/sqrt(theta)) - 1;

C_sum = (S * int_cks + I * int_cki + R * int_ckr)/(A/sqrt(theta)) - 1;

N = (S * ns + I * ni + R * nr) / (1/sqrt(theta)) - 1;

Us = us + betta*Us(1);

Ui = ui + betta*Ui(1);

Ur = ur + betta*Ur(1);

welfare = S*Us + I*Ui + R*Ur;

end;

@#if run_perfect_foresight == 1
    shocks;
        var     eps;
        periods 1:1;
        values  0.0001;

        var     step;
        periods 9:35;
        values  -0.7;

        var     pi_s;
        periods 1:250;
        values  1.48e-6;
    end;

    perfect_foresight_setup(periods = 250);
    oo_.endo_simul = csvread('init.csv');
    perfect_foresight_solver;
@#endif
clean_current_folder;