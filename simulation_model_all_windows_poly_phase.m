clear all; clc;
%% Ultrasounic Model With Barker Code (Pulse Comparsion)
%% Ultrasounic Model: 5khz

[t1 tx_signal] = tx_signal();
rx_signal = tx_signal .* hamming_window(length(tx_signal));

figure(1);
subplot(1,2, 1); plot(t1, tx_signal); title('TX Signal'); xlabel('Time'); ylabel('Amp.'); ylim([-2 2]);
subplot(1,2, 2); plot(t1, rx_signal, '-r'); title('RX Signal'); xlabel('Time'); ylabel('Amp.'); ylim([-2 2]);

% Generate window samples
us_window_5 = [];
padding = zeros(1, length(rx_signal));
for number_window = 1:5
    us_window_5 = [us_window_5 rx_signal];
end

% Generate time scale for window
t2 = [0];

for step = 2:length(us_window_5)
    t2 = [t2 t2(end) + t1(2)];
end
% Correlations rx window with tx siganl
corr_window = xcorr(us_window_5, tx_signal);

% Plot result
figure(2);
subplot(2,1, 1); plot(t2, us_window_5, '-r'); title('RX Window'); xlabel('Time'); ylabel('Amp.'); ylim([-2 2]);
subplot(2,1, 2); plot(corr_window(440:end), '-r');
title('Correlation of RX Window with RX Signal'); xlabel('Samples'); ylabel('Mag.');

%% Ultrasounic Model: 10khz Increase resulation by increase the frequency experiment
f2 = 5e3;
t3 = linspace(0, 10/f2, 2*f2);
tx_signal = sin(2*pi*f2*t3);
rx_signal = tx_signal .* hamming_window(length(tx_signal));

% Generate window samples
us_window_10 = [];
padding = zeros(1, length(rx_signal));
for number_window = 1:5
    us_window_10 = [us_window_10 rx_signal padding];
end

% Generate time scale for window
t4 = [0];

for step = 2:length(us_window_10)
    t4 = [t4 t4(end) + t2(2)];
end
% Correlations rx window with tx siganl
corr_window = xcorr(us_window_10, tx_signal);

% Plot result
figure(4);
subplot(2,1, 1); plot(t4, us_window_10, '-r'); title('RX Window at 10KHz'); xlabel('Time'); ylabel('Amp.'); ylim([-2 2]);
subplot(2,1, 2); plot(corr_window(90800:end), '-r');
title('Correlation of RX Window with RX Signal'); xlabel('Samples'); ylabel('Mag.');
