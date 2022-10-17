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
legend('f_X(x)','P\{X > 3.957\}')
grid on;
xlabel('X');
ylabel('f_X(x)')
title('Computing P\{X > 3.957\} from f_X(x)');