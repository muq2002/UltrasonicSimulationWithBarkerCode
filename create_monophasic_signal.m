function [t, signal] = create_monophasic_signal(signal_freq, number_of_cycles)
    t = linspace(0, number_of_cycles/signal_freq, 2*signal_freq);
    signal = sin(2*pi*signal_freq*t);
end