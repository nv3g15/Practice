%% First Sim
Sim_Time = 7;
Step_Value = 1;
M = 1;
b = 10;
k = 20;

%% P Controller Params
% Kp = 1000;
% Ki = 0;
% Kd = 0;
% sim('project_7_t');

%% PID Controller Params
Kp = 350;
Ki = 300;
Kd = 50;
sim('project_7');

%% Plotting
figure(1), clf
plot(out.IN.time, out.IN.data)
hold all
plot(out.OUT.time, out.OUT.data)