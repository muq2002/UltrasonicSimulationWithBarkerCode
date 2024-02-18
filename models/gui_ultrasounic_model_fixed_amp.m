
clear; close all; clc;
%% Monophasic Ultrasonic Model: Create Signal

signal_freq = 1e3;
number_of_cycles = 10;
[t, Tx_signal] = create_monophasic_signal(signal_freq, number_of_cycles);
Rx_signal = create_attenuated_signal(Tx_signal);
figure(1);
for precentage = 1:-0.1:0
    ultrsounic_monophasic_model_fixed_amp(t, Tx_signal, Rx_signal, precentage);
    pause()
end


%% Multipahsic Ultrasonic Model: Create Signal
signal_freq = 1e3;
number_of_cycles = 10;
[t, Tx_signal] = create_multiphasic_signal(signal_freq, number_of_cycles);
Rx_signal = create_attenuated_signal(Tx_signal);
figure(2);
%% Multipahsic Ultrasonic Model: Create Model with Static TX signal
for precentage = 1:-0.1:0
    ultrsounic_multiphasic_model_fixed_amp(signal_freq, Tx_signal, precentage);
    pause()
end
figure(3)
%% Multipahsic Ultrasonic Model: Create Model with dynamic TX signal
 [t Tx_signal] = create_multiphasic_signal(signal_freq,10);
 Rx_signal = create_attenuated_signal(Tx_signal);
for precentage = 1:-0.1:0
    Old_Tx_Signal = Tx_signal;
    ultrsounic_multiphasic_model_dynamic(Tx_signal, Rx_signal, precentage);
    [t Tx_signal] = create_multiphasic_signal(signal_freq,10);
    Rx_signal = create_attenuated_signal(Old_Tx_Signal);
    pause()
end