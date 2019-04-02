% LCS_CA1 - part3 - Negar Mirgati - 810194413
InitConds = [0.1, 2];
beta = 0.4; % death rate of preys
gamma = 0.3; % death rate of predators
ro = 3; % growth rate of predators
alpha = 4; % exponential growth in population - preys

%solving differential equations and plotting graphs 
%time dependecies graph
time_steps = [1 59];

[ts,x] = ode45(@(ts,x) predPrey(x, alpha, beta ,gamma, ro), time_steps, InitConds(1:2));
figure(1);
plot(ts,x(:,1),'',ts,x(:,2),''), xlabel('timestep'), ylabel('x,y values'),axis([1 59 0 45]) 
title(['PredPrey - Time - x = ',num2str(InitConds(1)),' & y = ',num2str(InitConds(2))])
legend('x - Preys','y - Predators')


figure(2);
plot(x(:,1), x(:,2),''), xlabel('preys'), ylabel('preds'),axis([-0.5 1.5 0 30]) 
title(['PredPrey - predVsPrey - x = ',num2str(InitConds(1)),' & y = ',num2str(InitConds(2))])
legend('x = Preys ,  y = Preds')




