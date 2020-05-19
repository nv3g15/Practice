%% Load Data
Data = xlsread('Battery_Parameters.xlsx');

%% Allocate the Data
SOC = Data(:,1);
OCV = Data(:,2);
R_c = Data(:,3);
R_d = Data(:,4);

%% Plot
figure(1), clf
subplot(311)
plot(SOC, OCV)

subplot(312)
plot(SOC, R_c)

subplot(313)
plot(SOC, R_d)
%% Simulation
Sim_Time = 3600;

I  = 2.3; % [Amp]
Cn = 2.3 * 3600; % Capacity [Amp-s]

sim('project_5')