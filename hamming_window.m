function hamming_window = hamming_window(window_size)
    % Define the Hamming window coefficients
    alpha = 0.54;
    beta = 0.46;

    % Generate the Hamming window
    hamming_window = zeros(1, window_size);
    for i = 1:window_size
        hamming_window(i) = alpha - beta * cos(2 * pi * (i - 1) / (window_size - 1));
    end
end
