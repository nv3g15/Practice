%% First Sim
Sim_Time = 7;
Step_Value = 1;
M = 1;
b = 10;
k = 20;

%% PID Controller Params
Kp = 300;
Ki = 200;
Kd = 200;
sim('project_8');

%% Plotting
figure(1), clf
plot(out.IN.time, out.IN.data)
hold all
plot(out.OUT.time, out.OUT.data)