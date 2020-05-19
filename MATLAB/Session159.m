%%
%     COURSE: Master MATLAB through guided problem-solving
%    SECTION: Nonparametric statistics
%      VIDEO: Permutation testing
% Instructor: mikexcohen.com
%
%%

% two log-norm datasets
N1 = 40;
N2 = 60;
data1 = exp( 5.3 + randn(N1,1)*.5 );
data2 = exp( 5.0 + randn(N2,1)*.5 );

% plot the distributions
figure(1), clf
subplot(141)
plot(1,data1,'bo','markerfacecolor','k','markersize',10,'linew',3), hold on
plot(2,data2,'ro','markerfacecolor','k','markersize',10,'linew',3)
set(gca,'xlim',[.5 2.5],'xtick',[1 2],'xticklabel',{'data 1';'data 2'})

%% permutation testing

% combine both datasets into one variable
alldata = [data1; data2];

% define a vector of condition mapping
mapping = [ ones(N1,1); ones(N2,1)+1 ];

% numerator of the t-test: difference of means
tnum = mean(alldata(mapping==1)) - mean(alldata(mapping==2));
    
% denominator of t-test: square root of variances divided by N
tden = sqrt( var(alldata(mapping==1))/N1 + var(alldata(mapping==2)/N2 ));

% observed t-value is the ratio
obs_t = tnum / tden;

% number of permutations
npermutes = 1000;
nmetas    = 50;

% initialize permuted vector (and meta-permutation for the bonus)
perm_t = zeros(npermutes,1);
meta_z = zeros(nmetas,1);

% loop over permutation tests
for metai=1:nmetas
    
    % loop over iterations for permutation
    for permi=1:npermutes

        % randomize the condition mapping
        fake_mapping = mapping( randperm(N1+N2) );

        % new t-value from permuted data
        tnum = mean(alldata(fake_mapping==1)) - mean(alldata(fake_mapping==2));
        tden = sqrt( var(alldata(fake_mapping==1))/N1 ...
                     + ...
                     var(alldata(fake_mapping==2))/N2 ); 

        % permutation t-test for this iteration
        perm_t(permi) = tnum / tden;
    end
    
    meta_z(metai) = (obs_t - mean(perm_t)) / std(perm_t);
end

% make a histogram of the permutation t-values
subplot(4,4,[2 3 4 6 7 8 10 11 12])
histogram(perm_t,50);

% plot the observed t-value on top as a line
hold on
plot([1 1]*obs_t,get(gca,'ylim'),'r--','linew',3)

% z-value is the normalized distance of the observed t-value from the
% permutation distribution
zstat = (obs_t-mean(perm_t)) / std(perm_t);

title('Empirical H_0 distribution')
legend({'H_0';[ 'Zscore = ' num2str(zstat) ]})
set(gca,'xlim',[-1 1]*5)

% plot the distribution of meta permutation test values
subplot(4,4,[14 15 16])
histogram(meta_z,10)
set(gca,'xlim',[-1 1]*5)
title('Meta-z value distribution')

%%
