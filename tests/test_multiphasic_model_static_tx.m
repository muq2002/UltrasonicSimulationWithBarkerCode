clear; close all; clc;
freq = 1e3;
Tx_signal = create_multiple_phase_signal(freq,10);
for interference_percentage = 1:-0.1:0
    figure(fix(10*interference_percentage)+20);
    ultrsounic_multiphasic_model(Tx_signal, interference_percentage, true);
end