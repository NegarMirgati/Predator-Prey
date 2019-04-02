A =  [0 -0.04; 0.3 0];
B = [1; 0];
C = [1 0];
D = 0;
SS=ss(A,B,C,D);
TFs=tf(SS);
[n,d]=ss2tf(A,B,C,D);
mySys_tf = tf(n,d);
 
%%% step and impulse response
subplot(4,1,1)
step(TFs, 1000)

subplot(4,1,2)
impulse(TFs, 1000)

%%% transfer function to state space
[Aprime, Bprime,Cprime, Dprime] = tf2ss(n, d);


%%% part 8 - closed loop with k = 0.01
k = 0.01;
Tfeed = feedback(TFs*k, 1);
subplot(4,1,3);
step(Tfeed);
S = stepinfo(Tfeed);

%%%% part 9 -ramp response
s = tf('s');
subplot(4,1,4), step(Tfeed / s);  % Ramp response
StepRampInfo = stepinfo(Tfeed / s);


%%% part 10 - response to arbitrary Sinusoidal Inputs
t = linspace(0, 100, 1000);   
u = sin(130*t);           
y = lsim(Tfeed, u, t); % Calculate System Response
figure(2)
subplot(4, 1, 1)
plot(t, y)
grid


u = 10 * sin(10*t);           
y = lsim(Tfeed, u, t); % Calculate System Response
figure(2)
subplot(4, 1, 2)
plot(t, y)
grid

u = 34 * sin(0.1*t);           
y = lsim(Tfeed, u, t); % Calculate System Response
figure(2)
subplot(4, 1, 3)
plot(t, y)
grid


u = 5 * sin(t);           
y = lsim(Tfeed, u, t); % Calculate System Response
figure(2)
subplot(4, 1, 4)
plot(t, y)
grid


%%%% part 11 
%%% zeros and poles
%P = pole(TFs);
%disp('G Pole: ')
%disp( pole(TFs));
%disp('G Zero: ')
%disp(zero(TFs));
%Gtest = zpk([],P,1);

%disp(Gtest);

%tspan  = [1 100];
%ics = [0.1, 2];
%newG  = (1)/(s^2 + 0.012);
%sysr = minreal(newG); 
%newN = [0 0 1];
%newD = [1 0 0.012];
%[Ax, Bx, Cx, Dx] = tf2ss(newN, newD);

%[ts,x] = ode45(@(ts, x) newG, tspan, ics(1:2));
%figure(3);

%subplot(2, 1, 1)
%plot(ts,x(:,1),'',ts,x(:,2),''), xlabel('timestep'), ylabel('x,y values'),axis([1 100 -2.5 2.5]);
%legend('x - Preys','y - Predators');
%subplot(2, 1, 2)
%plot(x(:,1), x(:,2),''), xlabel('preys'), ylabel('preds'),axis([-1 1 -5 5]) 
%title(['PredPrey - predVsPrey - x = ',num2str(ics(1)),' & y = ',num2str(ics(2))])
%legend('x = Preys ,  y = Preds')










 