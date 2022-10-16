% Author: O. Sowatzke
%
% Date: 10/21/2022
%
% Subject: Script computes the probability that a random variable 
% X ~ N(1,1) is greater than 3.957 using both Monte Carlo Sampling and 
% Importance Sampling

%% Monte Carlo Sampling

% number of samples from distribution
m = 100:100:1e5;

% empty array of probabilities
p_mc = zeros(size(m));

% loop through number of samples
for i = 1:length(m)
    
    % generate samples of random variable
    X = 1 + randn(1,m(i));

    % sample distribution 
    p_mc(i) = sum(X > 3.957)/m(i);
end

% plot result
figure(1)
clf;
plot(m,p_mc,'LineWidth',1.5);
hold on;
plot([m(1) m(end)], 0.001553*ones(1,2),'LineWidth',1.5);
xlabel('Number of Samples');
ylabel('Probability');
title('P(X > 3.957) - Monte Carlo Estimate');
legend('Monte Carlo Estimate', 'Truth');
grid on;

% compute error
err_mc = abs(0.001553 - p_mc);

% plot error
figure(2)
clf;
plot(m,err_mc,'LineWidth',1.5);
xlabel('Number of Samples');
ylabel('Probability Error');
title('Monte Carlo Probability Error');
grid on;

%% Importance Sampling

% number of samples from distribution
m = 100:100:1e5;

% empty array of probabilities
p_is = zeros(size(m));

% loop through number of samples
for i = 1:length(m)
    
    % generate samples of random variable g(x)
    X = 3.957 + randn(1,m(i));

    % compute weights
    fx = 1/sqrt(2*pi)*exp(-(X-1).^2/2);
    gx = 1/sqrt(2*pi)*exp(-(X-3.957).^2/2);
    W = fx./gx;

    % sample distribution 
    p_is(i) = sum((X > 3.957).*W)/m(i);
end

% plot result
figure(3)
clf;
plot(m,p_is,'LineWidth',1.5);
hold on;
plot([m(1) m(end)], 0.001553*ones(1,2),'LineWidth',1.5);
xlabel('Number of Samples');
ylabel('Probability');
title('P(X > 3.957) - Importance Sampling Estimate');
legend('Importance Sampling Estimate', 'Truth');
grid on;

% compute error
err_is = abs(0.001553 - p_is);

% plot error
figure(4)
clf;
plot(m,err_is,'LineWidth',1.5);
xlabel('Number of Samples');
ylabel('Probability Error');
title('Importance Sampling Probability Error');
grid on;

%% Probability of Error Comparison
% overlay both error plots
figure(5)
clf;
plot(m,err_mc,'LineWidth',1.5);
hold on;
plot(m,err_is,'LineWidth',1.5);
xlabel('Number of Samples')
ylabel('Probability Error')
title('Probability Error Comparison')
grid on;
legend('Monte Carlo Estimate', 'Importance Sampling Estimate');




