function [sliding_amount, out_signal] = sliding_signals_number(x_signal, y_signal, start_point)
    x_length = length(x_signal);
    y_length = length(y_signal);

    merged_signals = [x_signal y_signal];
    raw_signal = zeros(1, length(merged_signals));

    % determine the points of sliding
    end_point = y_length + start_point;
    sliding_amount = length(raw_signal) - start_point - y_length;

    raw_signal_x = [x_signal  zeros(1, length(y_signal))];
    raw_signal_y = [zeros(1, start_point) y_signal zeros(1, sliding_amount)];
    
    out_signal = raw_signal_x  + raw_signal_y;
    
end