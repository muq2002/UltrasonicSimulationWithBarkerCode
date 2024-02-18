% clear; close all; clc;
% 
% 
% %% Monophasic Ultrasonic Model
% signal_freq = 1e3;
% number_of_cycles = 10;
% [t, Tx_signal] = create_monophasic_signal(signal_freq, number_of_cycles);
% Tx_signal = 0.9 * Tx_signal;
% Rx_signal = create_attenuated_signal(Tx_signal);
% figure(1);
% 
% for attenuation_precentage = 1:-0.1:0
%     Rx_signal = attenuation_precentage * create_attenuated_signal(Tx_signal);
%     ultrsounic_monophasic_model_dynamic_amp(t, Tx_signal, Rx_signal, attenuation_precentage);
%     pause()
% end
% 
% %% Multipahsic Ultrasonic Model
% signal_freq = 1e3;
% number_of_cycles = 10;
% [t, Tx_signal] = create_multiphasic_signal(signal_freq, number_of_cycles);
% Rx_signal = create_attenuated_signal(Tx_signal);
% figure(2);
% 
% for attenuation_precentage = 1:-0.1:0
%     Tx_signal = 0.9 * Tx_signal;
%     Rx_signal = attenuation_precentage * create_attenuated_signal(Tx_signal);
%     ultrsounic_multiphasic_model_dynamic_amp(Tx_signal, Rx_signal, attenuation_precentage);
%     pause()
% end

%% Multipahsic Ultrasonic Model
signal_freq = 1e3;
number_of_cycles = 10;
[t, Tx_signal] = create_multiphasic_signal(signal_freq, number_of_cycles);
Rx_signal = create_attenuated_signal(Tx_signal);
figure(2);

attenuation_precentage = 0.9;
Tx_signal = 0.9 * Tx_signal;
Rx_signal = create_attenuated_signal(attenuation_precentage * Tx_signal);

ultrsounic_multiphasic_model_dynamic_amp(Tx_signal, Rx_signal, attenuation_precentage);


