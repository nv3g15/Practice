%% Setting up a proportional controller
m = 1000;
b = 50;
r = 10;

s = tf('s');            % variable 's' in the Laplace domain
Plant_TF = 1/(m*s + b); % generates the transfer function

Kp = 1000;
Controller = pid(Kp);   % generates a PID controller (only P used here)

TF_ClosedLoop = feedback(Controller*Plant_TF,1); % reduces the model

%% Use Kp equal to 100 and a reference frame of 10m/s
t = 0:0.1:20;
step(r*TF_ClosedLoop,t) % runs the system (produces a plot)
axis([0 20 0 10])

%% PI controller (notice reduction of the steady-state error)
Kp = 800;
Ki = 40;
Controller = pid(Kp,Ki);

TF_ClosedLoop = feedback(Controller*Plant_TF,1);

step(r*TF_ClosedLoop,t)
axis([0 20 0 10])