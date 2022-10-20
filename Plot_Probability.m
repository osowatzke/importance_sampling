u = 1;
sigma = 1;
T = 3.957;
x = -3:0.001:5;
fx = 1/sqrt(2*pi*sigma^2)*exp(-(x-u).^2/(2*sigma^2));
figure(1);
clf;
plot(x, fx)
hold on;
fx = fx(x >= 3.957);
x = x(x >= 3.957);
area(x, fx);
legend('f_X(x)','P\{I(x)=1\}')
grid on;
xlabel('x');
ylabel('f_X(x)')
title('P\{I(x)=1\} : Monte Carlo Simulation');

u = 3.957;
sigma = 1;
T = 3.957;
x = 0:0.001:8;
fx = 1/sqrt(2*pi*sigma^2)*exp(-(x-u).^2/(2*sigma^2));
figure(2);
clf;
plot(x, fx)
hold on;
fx = fx(x >= 3.957);
x = x(x >= 3.957);
area(x, fx);
legend('g_X(x)','P\{I(x)=1\}')
grid on;
xlabel('x');
ylabel('g_X(x)')
title('P\{I(x)=1\} : Importance Sampling');

