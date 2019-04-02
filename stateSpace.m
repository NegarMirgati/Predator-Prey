tspan  = [1 59];
initConds = [0.1, 2];
A = [0 -0.04; 0.3 0];
[ts,x] = ode45(@(ts, x) sys(ts, x, A), tspan, initConds(1:2));
plot(ts,x(:,1),'',ts,x(:,2),''), xlabel('timestep'), ylabel('x,y values'),axis([0 60 -2.5 2.5]);
legend('x - Preys','y - Predators');


figure(2);
plot(x(:,1), x(:,2),''), xlabel('preys'), ylabel('preds'),axis([-1 1 -5 5]) 
title(['PredPrey - predVsPrey - x = ',num2str(initConds(1)),' & y = ',num2str(initConds(2))])
legend('x = Preys ,  y = Preds')