%% Narrowband Filter via Frequency-Domain Gaussian

%% setup

% generate broadband signal
srate  = 512; % Hz
time   = 1/srate:1/srate:5; % create 5 seconds of data using this sampling rate
npnts  = length(time);
signal = randn(npnts,1);

%% filter

% create frequency-domain filter
fwhm  = 4; % full-width at half-maximum, in Hz
peakf = 8; % peak frequency, in Hz

% frequencies (up to srate is a programming trick)
hz = linspace(0,srate,npnts)'; % should really go up to Nyquist, i.e. half-sampling rate

% create Gaussian
s  = fwhm*(2*pi-1) / (4*pi); % normalised width
x  = hz - peakf; % shifted frequencies
fx = exp(-.5*(x/s).^2); % gaussian

% filter the signal via circular convolution
filtdat = 2*real( ifft(fft(signal).*fx) );

%% compute empirical peak and FWHM

fidx  = dsearchn(hz,8);
fwhmX = [ dsearchn(fx(1:fidx),0.5) fidx+dsearchn(fx(fidx:end),0.5)-1 ];

% empirical FWHM (Hz)
empfwhm = diff(hz(fwhmX));

% empirical peak frequency
emppeak = hz(fidx);

%% plots

figure(1),clf

% original and filtered signals
subplot(211), hold on
h = plot(time,signal);
set(h,'color',[1 1 1]*.7)
plot(time,filtdat,'r','linew',2)
xlabel('Time (s)'), ylabel('Amplitude gain')
title('Signals in time domain')

% spectral response of the filter
subplot(212), hold on
plot(hz,fx,'ko-','markersize',6,'markerfacecolor','y')
set(gca,'xlim',[max(peakf-10,0) peakf+20]);
xlabel('Frequency (Hz)'), ylabel('Amplitude gain')

% dashed line at 50% gain
plot(hz(fwhmX), fx(fwhmX), 'k--')