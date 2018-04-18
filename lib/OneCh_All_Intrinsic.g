% default.g
SAMPLE_RATE 20000
ALPHA 10		% voltage gain on current-clamp amplifier
THETA 14 10 20 10	% R1 = 200 from ITC18 DAC0 (ADC0) and 500 from Multiclamp700A scaled out (ADC2), R2 = 450 for all channels
GAMMA 0.4		% 0.4 nA/V Multiclamp low setting
EPSILON 1		% 1 nS/V external stimuli

BYPASS DA0 AD0		% default

% Tonic GABAA currents (SM2 Manual)
OHMIC DA0 1 AD2 -65

% Tonic GABAA currents
OHMIC DA0 1 AD2 -67.7

% Leak channel (SM2 Manual)
OHMIC DA0 0.9 AD2 -14

% Leak channel
OHMIC DA0 0.9 AD2 -106.2

% Squid standard (SM2 Manual)
SQUID_STANDARD DA0 480 50 0.9 AD2 -14

% Classical HH K conductance (SM2 Manual)
HODGKIN_HUXLEY DA0 50 AD2 -12
	(10.0-v)/(100.0*(exp((10.0-v)/10.0)-1.0))	% alpha_n
	0.125*exp(-v/80.0)				% beta_n
	4						% x
	0	0	0				% no inactivation - all parameters zero

% Classical HH K conductance
HODGKIN_HUXLEY DA0 50 AD2 -106.2
	(10.0-v)/(100.0*(exp((10.0-v)/10.0)-1.0))	% alpha_n
	0.125*exp(-v/80.0)				% beta_n
	4						% x
	0	0	0				% no inactivation - all parameters zero

% IKDR: Rhodes and Llinas (2005) J Physiol 565.3: 765-781.
HODGKIN_HUXLEY DA0 60 AD2 -80
	-16*(v-(-14.9))/(exp(-(v-(-14.9))/5.0)-1.0)	% alpha_m
	250.0*1.5*exp(-(v-(-30.0))/40.0)		% beta_m
	1						% x
	0	0	0				% no incactivation

% IKDR: Rhodes and Llinas (2005) J Physiol 565.3: 765-781.
HODGKIN_HUXLEY DA0 60 AD2 -106.2
	-16*(v-(-14.9))/(exp(-(v-(-14.9))/5.0)-1.0)	% alpha_m
	250.0*1.5*exp(-(v-(-30.0))/40.0)		% beta_m
	1						% x
	0	0	0				% no incactivation

% Classical HH Na conductance (SM2 Manual)
HODGKIN_HUXLEY DA0 480 AD2 115
	(25.0-v)/(10.0*exp((25.0-v)/10.0)-1.0))		% alpha_m
	4.0*exp(-v/18.0)				% beta_m
	3						% x
	exp(-v/20.0)					% alpha_h
	1.0/(exp((30.0-v)/10.0)+1.0)			% beta_h
	1						% y

% Classical HH Na conductance:
HODGKIN_HUXLEY DA0 480 AD2 108.8
	(25.0-v)/(10.0*exp((25.0-v)/10.0)-1.0))		% alpha_m
	4.0*exp(-v/18.0)				% beta_m
	3						% x
	exp(-v/20.0)					% alpha_h
	1.0/(exp((30.0-v)/10.0)+1.0)			% beta_h
	1						% y

% INa: Rhodes and Llinas (2005) J Physiol 565.3: 765-781.
HODGKIN_HUXLEY DA0 400 AD2 108.8
	320*(v-(-29.9))/(1-exp(-(v-(-29.9))/4.0))	% alpha_m
	280*(v-(-2.9))/(exp((V-(-2.9))/5.0)-1)		% beta_m
	3						% x
	24.0*(v-(-22))/(1.0-exp((-v-(-22.0))/5.0))	% alpha_h
	-9.1*(v-(-47))/(1.0-exp((v-(-47.0))/5.0))	% beta_m
	1						% y

% Ih current: Destexhes et al. (1993) Biophys. J. 65:1538-1552. (SM2 Manual)
HODGKIN_HUXLEY DA0 20 AD2 -43
	1/(1+exp((v+68.9)/6.5))/exp((v+158.6)/11.2)*(1+exp((v+75)/5.5)		% alpha_F
	(1-1/(1+exp((v+68.9)/6.5))/exp((v+158.6)/11.2)*(1+exp((v+75)/5.5))	% beta_F
	1/(1+exp((v+68.9)/6.5))/exp((v+183.6)/15.24)				% alpha_S
	(1-1/(1+exp((v+68.9)/6.5))/exp((v+183.6)/15.24)				% beta_S

% Ih: Rhodes and Llinas (2005) J Physiol 565.3: 765-781.
HODGKIN_HUXLEY_TAU DA0 0.03 AD2 -43
	100.0/(exp(-(v-(-75.0))/(11.0))+exp((v-(-75.0))/(11.0))))		% tau_m (ms)
	1.0/(1.0+exp((v-(-75.0))/5.5))						% m_infinity
	1									% x
	0									% tau_h (ms)
	0									% h_infinity
	0									% y

% It current: Rhodes and Llinas (2005) J Physiol 565.3: 765-781.
HODGKIN_HUXLEY_TAU DA0 20 AD2 60
	0.2+9.4/(exp((v-(-63))/(18.6))+exp(-(v-(-63))/(18.6)))			% tau_m (ms)
	1.0/(1.0+exp(-(v-(-63))/6.2))						% m_infinity
	3									% x
	4.2+11.6*exp(-(v-(-61.5))/45.0)						% tau_h (ms)
	1.0/(1.0+exp((v-(-80))/4.0))						% h_infinity
	1									% y