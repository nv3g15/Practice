%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Nonlinear model fitting
%      VIDEO: Two-piece linear regression
% Instructor: mikexcohen.com
%
%%

% generate a triangle distribution
a = .2;
c = .6;
b = .9;
x = rand(1,10000);

Fc = (c-a) / (b-a);

y(x<Fc) = a + sqrt(x(x<Fc)*(b-a)*(c-a));
y(x>Fc) = b - sqrt((1-x(x>Fc))*(b-a)*(b-c));


% convert x and y into a distribution
[y,x] = hist(y,100);
y = y./sum(y);

% initial point
[~,initB] = min(abs(x-mean(x)));

% create a function handle
funch = @(initB) fit2segLinear(initB,x,y);

% and fit the model!
figure(2), clf
[optBreakPoint,sse,exitflag,fmininfo] = fminsearch(funch,initB);

%%
