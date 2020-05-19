%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Nonlinear model fitting
%      VIDEO: Fit a circle to a noisy ring
% Instructor: mikexcohen.com
%
%%

N = 100;

% define theta for circle perimeters
th = linspace(0,2*pi,N); % theta (angles)
r  = 3;                  % radius

% need Cartesian coordinates from polar coords.
x = r*cos(th) + randn(1,N)/10;
y = r*sin(th) + randn(1,N)/10;

% plot the ring
figure(1), clf
plot(x,y,'s')
axis square


% initialize radius and setup function min
initParms = 6;
funch = @(initParms) fitCirc(initParms,[x; y]);


% fit the model using fminsearch
figure(1), clf
[outparams1,sse1,exitflag1,fmininfo] = fminsearch(funch,initParms);

% fit the model using lsqnonlin
[outparams2,~,sse2,exitflag2,lsinfo] = lsqnonlin(funch,initParms);

%% computation time and SSE tests

% number of repetitions
nreps = 100;

% initialize
[sses,comptime] = deal( zeros(2,nreps) );

% loop
for repi=1:nreps
    
    % start timer and run fminsearch
    tic
    [outparams1,sse1] = fminsearch(funch,initParms);
    % stop timer and collect data
    comptime(1,repi) = toc;
    sses(1,repi)     = sse1;
    
    
    % same for lsqnonlin
    tic
    [outparams2,~,sse2] = lsqnonlin(funch,initParms);
    comptime(2,repi) = toc;
    sses(2,repi)     = sse2;
    
end

% plot the computation times
figure(2), clf
subplot(121)
plot(repmat([1;2],1,nreps),comptime*1000,'o','markersize',16,'markerfacecolor','k')
set(gca,'xlim',[0 3],'xtick',1:2,'xticklabel',{'fms';'lsnl'})
ylabel('Computation times (ms)')

% plot the SSEs
subplot(122)
plot(repmat([1;2],1,nreps),sses,'o','markersize',16,'markerfacecolor','k')
set(gca,'xlim',[0 3],'xtick',1:2,'xticklabel',{'fms';'lsnl'})
ylabel('Sum of squared errors')

%% bonus...

rs = [1 4];
rotang = [ pi/2 pi/11 ];

x = rs(1) * cos(th+rotang(1)) + randn(1,N)/10;
y = rs(2) * sin(th+rotang(2)) + randn(1,N)/10;

figure(3),clf
plot(x,y,'o')
axis square

% fit an oval
initParms = [ 2 2 pi pi ];
funch = @(initParms) fitOval(initParms,[x;y]);

[outparams1,sse1,exitflag1,fmininfo] = fminsearch(funch,initParms);

%%
