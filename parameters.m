% Case 1: pi_a  = 0
% Case 2: pi_a != 0

eta     = 10;
pi_d    = 7*0.005/18;
pi_r    = 7/18 - pi_d;
betta   = 0.96^(1/52);
A       = 39.835;
theta 	= 0.001275;
phi1    = 0.2;
ups1    = 0.5;

if caseid == 1
    pi_s    = 4.05e-7;
    pi_a    = 0;
elseif caseid == 2
    pi_s    = 1.77e-7;
    pi_a    = 0.34;
end