%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Nonparametric statistics
%      VIDEO: Bootstrapping to define confidence intervals
% Instructor: mikexcohen.com
%
%%

% create data
N = 30;
data = randn(N,1).^3;

% number of bootstraps
nstraps = 1000;




% show a histogram of the data
figure(1), clf
subplot(5,1,1:4)
hist(data)
hold on
% vertical line for the observed mean
ylim = get(gca,'ylim');
xlim = get(gca,'xlim');
plot([1 1]*mean(data),ylim,'m--','linew',3)


% initialize bootstrap distribution
bootmean = zeros(nstraps,1);

% the loop that does bootstrapping
for booti=1:nstraps
    
    % pick values with replacement
    vals2sample = randsample(N,N,1);
%     vals2sample = ceil(N*rand(N,1));
%     unnum = numel(unique(vals2sample));
    
    % compute mean of that sample
    bootmean(booti) = mean( data(vals2sample) );
end

% show a histogram of the bootstrapped mean values
subplot(5,1,5)
hist(bootmean)
xlabel('Values')
set(gca,'xlim',xlim)

% get confidence intervals
ni95 = prctile(bootmean,[2.5 97.5]);

% bootsort = sort(bootmean);
% ni95 = bootsort( dsearchn( linspace(0,100,nstraps)', [2.5 97.5]' ) );

% add lines for the sample mean and confidence intervals
subplot(5,1,1:4), hold on
plot([1 1]*ni95(1),ylim,'g--','linew',3)
plot([1 1]*ni95(2),ylim,'g--','linew',3)

% some labels and legend
ylabel('Count')
legend({'data';'Mean';'95% CI'})


%%
