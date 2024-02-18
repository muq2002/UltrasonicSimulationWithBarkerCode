function  attenuated_signal = create_attenuated_signal(signal)
    % Generate the Hamming window
    window_size = length(signal);
    window = hamming_window(window_size);
    attenuated_signal = signal .* window;
end 


