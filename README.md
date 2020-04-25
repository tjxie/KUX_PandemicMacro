# Macroeconomic dynamics and reallocation in an epidemic
Krueger, D., H. Uhlig, and T. Xie (2020)

Version: April 23, 2020

## Abstract
In this paper we argue that endogenous shifts in private consumption behavior across sectors of the economy can act as a potent mitigation mechanism during an epidemic or when the economy is re-opened after a temporary lockdown. Extending the theoretical framework proposed by Eichenbaum-Rebelo-Trabandt (2020), we distinguish goods by their degree to which they can be consumed at home rather than in a social (and thus possibly contagious) context. We demonstrate that, within the model the "Swedish solution" of letting the epidemic play out without government intervention and allowing agents to shift their sectoral behavior on their own can lead to a substantial mitigation of the economic and human costs of the COVID-19 crisis, avoiding more than 80 of the decline in output and of number of deaths within one year, compared to a model in which sectors are assumed to be homogeneous.  For different parameter configurations that capture the additional social distancing and hygiene activities individuals might engage in voluntarily, we show that infections may decline entirely on their own, simply due to the individually rational re-allocation of economic activity: the curve not only just flattens, it gets reversed.

## Files

- **simulation.m** - main simulation file producing figures for the baseline scenario in Fig. 1
- **parameters.m** - parameter values
- **multisector.mod** - dynare file with model equations
- **init.mat** - initial values for perfect foresight solutions
- **init/init_baseline.mat** - initial values for the baseline scenario
- **init/init_constant_phi.mat** - initial values for the homogeneous-sector economy
- **init/init_baseline_pi_a.mat** - initial values for the existence of autonomous infection