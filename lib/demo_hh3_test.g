% demo_hh_test.g
% illustrates use of HODGKIN_HUXLEY conductance
% adjusted for -70 mV resting potential
BYPASS DA0 AD1
CURRENT DA0 AD1
SAMPLE_RATE 40000  
ALPHA 10   % for P25M  voltage division with R1=150, R2 = 500
THETA 20 10 10 10   % for 50-ohm impedance and R1=150
GAMMA 2   % 2 nA/V Multiclamp high setting
EPSILON 10

% Classical HH Na conductance:
HODGKIN_HUXLEY
DA0 
500 
AD0 
60
	(25.0-(v+70))/(10.0*(exp((25.0-(v+70))/10.0)-1.0))	% alpha_m
	4.0*exp(-(v+70)/18.0)                                % beta_m
        3						% x
        0.07*exp(-(v+70)/20.0)					% alpha h
        1.0/(exp((30.0-(v+70))/10.0)+1.0)			% beta_h
        1						% y


% Classical HH K conductance:

HODGKIN_HUXLEY DA0 45 AD0 -82
	(10.0-(v+70))/(100.0*(exp((10.0-(v+70))/10.0)-1.0))	% alpha_n
	0.125*exp(-(v+70)/80.0)				% beta_n
	4						% x
	0 0 0						% no inactivation - all parameters zero




% and add in the leak channel:

OHMIC DA0 0.9 AD0 -84
