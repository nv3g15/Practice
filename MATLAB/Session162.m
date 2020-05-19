%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Nonlinear model fitting
%      VIDEO: Find the minimum of anonymous functions
% Instructor: mikexcohen.com
%
%%

%% intro to minimizing anonymous functions

funh = @(x) (x+abs(log(x))).^2;

% evaluate and plot the function
t = linspace(-10,10,100);
figure(1), clf, hold on
plot(t,funh(t),'k','linew',3)

% use fminsearch to find the minimum value
minval = fminsearch(funh,2);

% plot that minimum point
plot(minval,funh(minval),'ro','markerfacecolor','r','markersize',15)


%% now for the project

% define function
funh = @(x) sin(x.^2) + x.*cos(x).^2;

% plot the function
figure(2), clf
t = linspace(-pi,5*pi/2,200);
plot(t,funh(t),'k','linew',2)
set(gca,'xlim',[min(t) max(t)])
xlabel('x'), ylabel('f(x)')
title(func2str(funh))

% find the minimum
startVal = 3;
[xval,yval] = fminsearch(funh,startVal);

% plot the minimum
hold on
plot(xval,yval,'ro','markerfacecolor','r','markersize',15)

% plot the starting value as a red dotted line
plot([1 1]*startVal,get(gca,'ylim'),'r--')

legend({'f(x)';[ 'Min near ' num2str(startVal) ];'Srch start val'})

%% now for fminbnd

[xval,yval] = fminbnd(funh,1,6);
plot(xval,yval,'ro','markerfacecolor','g','markersize',10)

%% bonus: what (if anything) is wrong here!?!?

% the function (imaginary part of Fresnel equation)
funh = @(x) cumsum(sin(x.^2));

% plot the function
figure(3), clf, hold on
t = linspace(-2*pi,2*pi,200);
plot(t,funh(t),'k','linew',2)

% find and plot minimum
[xval,yval] = fminsearch(funh,-1);
plot(xval,yval,'ro','markerfacecolor','r','markersize',10)

%%
