%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Nonlinear model fitting
%      VIDEO: Fit a Gaussian to a distribution
% Instructor: mikexcohen.com
%
%%

% parameters of the Gaussian
peak = 4;
fwhm = 1;
cent = 3;
nois = .5;

x = -10:.1:10;

% create Gaussian and add noise
gaus = peak*exp( -(x-cent).^2 / (2*fwhm^2) );
gaus = gaus + randn(size(gaus))*nois;


% initialize:  peak  fwhm  center
initParms = [   5     .5     2 ];
funch = @(initParms) fitGaussian(initParms,x,gaus);

% run function minimization
figure(1), clf
[outparams,sse,exitflag,fmininfo] = fminsearch(funch,initParms);

%% Bonus: SSEs for a range of center and peak starting values

% list center and peak starting value ranges
cents = linspace(-6,10,50);
peeks = linspace(-6,10,55);

% initialize matrix of sum of squared errors
sses  = zeros(length(cents),length(peeks));

% loop over parameter spaces
for centi=1:length(cents)
    for peeki=1:length(peeks)
        
        % define initial parameters and function
        initParms = [ peeks(peeki) 2 cents(centi) ];
        funch = @(initParms) fitGaussian(initParms,x,gaus);
        
        % run minimization
        [~,sse] = fminsearch(funch,initParms);
        
        % populate SSE matrix
        sses(centi,peeki) = sse;
    end
end

% show results as an image
figure(2), clf
contourf(peeks,cents,sses,40,'linecolor','none')
xlabel('Peak starts'), ylabel('Center starts')

%%
