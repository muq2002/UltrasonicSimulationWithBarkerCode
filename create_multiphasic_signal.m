function [t, signal] = create_multiphasic_signal(signal_freq, cycle_number)
    % Specification of signal
    
    cycle_freq = signal_freq / 10;
    sampling_freq = 2*cycle_freq;
    t = linspace(0,1/cycle_freq,sampling_freq);
    
    % Choose phase signal with randi function to create random indexing
    % from 1 or 2
    phases = [0 pi];
    buffer_result = [];
    
    % Start create with number cycle
    for cycle_counter = 1:cycle_number
        cycle = sin(2*pi*cycle_freq*t + phases(1,randi(2)));
        buffer_result = [buffer_result cycle];
    end

    % Time output
    % This code used to solve the same length problem with time
    t = linspace(0,10/signal_freq,2*signal_freq);
    
    % Signal Output
    signal = buffer_result;
end