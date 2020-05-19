%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Nonlinear model fitting
%      VIDEO: Fit a sine wave
% Instructor: mikexcohen.com
%
%%

% parameters of the sine wave
a = 4;    % amplitude
f = 14;   % frequency
p = pi/3; % phase
n = 500;  % number of data points

% create a sine wave using normalized time points
t = (0:n-1)/n;
x = a*sin( t*f + p );

% initialize:  a   f   p
initParms = [  1   12  pi/2 ];
funch = @(initParms) fitSine(initParms,x);

figure(1), clf
[outparams,sse,exitflag,fmininfo] = fminsearch(funch,initParms);

%% bonus: timing with and without visualization

tic
[outparams,sse,exitflag,fmininfo] = fminsearch(funch,initParms);
toc
%%
