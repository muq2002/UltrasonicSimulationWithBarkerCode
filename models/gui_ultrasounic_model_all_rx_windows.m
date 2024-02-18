
%% Multipahsic Ultrasonic Model
%% Section 1: Signal Specification
[t1, tx] = tx_signal();
rx = create_attenuated_signal(tx);

%% RX window
rx_window = [];
for counter = 1:5
    rx_window = [rx_window rx];
end
t2 = generate_time(rx_window);
figure(1);
subplot(2,2,1); plot(t1, tx); title('TX Signal'); xlabel('Time (sec)'); ylabel('Amp');  ylim([-2 2]);
subplot(2,2,2); plot(t1, rx, '-r'); title('RX Signal'); xlabel('Time (sec)'); ylabel('Amp');  ylim([-2 2]);
subplot(2,2,[3 4]); plot(t2, rx_window); title('RX Window'); xlabel('Time (sec)'); ylabel('Amp'); ylim([-2 2]);


%% RX window With interference precentage

interference_precentage = 0.4;
rx_window = [];
voltage_signals = 1:-0.1:0.5;
for counter = 1:5
    result = sliding_signals_percentage(tx,voltage_signals(counter) * rx, interference_precentage);
    % buffer to collecting the RX signals 
    rx_window = [rx_window result];
end

t2 = generate_time(rx_window);
corr_signal = xcorr(rx_window, tx);
corr_signal = corr_signal(651:end);

figure(2);
subplot(3,2,1); plot(t1, tx); title('TX Signal'); xlabel('Time (sec)'); ylabel('Amp');  ylim([-2 2]);
subplot(3,2,2); plot(t1, rx, '-r'); title('RX Signal'); xlabel('Time (sec)'); ylabel('Amp');  ylim([-2 2]);
subplot(3,2,[3 4]); plot(t2, rx_window); title('RX Window'); xlabel('Time (sec)'); ylabel('Amp'); ylim([-2 2]);
subplot(3,2,[5 6]); plot(corr_signal); title('Correlation Result'); xlabel('Samples'); ylabel('Amp')
%%
[pks locs] = findpeaks(corr_signal, 'MinPeakHeight', 30);
figure(3);
subplot(2,1, 1); plot(corr_signal); title('RX Window Correlation'); xlabel('Samples'); ylabel('Amp');
subplot(2,1, 2); plot(corr_signal); hold on; plot(locs, pks, 'or');
title('Peaks of Correlation'); xlabel('Samples'); ylabel('Amp');
