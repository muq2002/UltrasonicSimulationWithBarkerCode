function out = sliding_signals_percentage(x,y, interference_percentage)
    number_of_samples_x = length(x);
    number_of_samples_y = length(y);
    % Find the number of smaples where the interference occured
    number_of_inerference_samples_x = floor( (interference_percentage * number_of_samples_x ));
    number_of_inerference_samples_y = floor( (interference_percentage * number_of_samples_y ));
    
    [sliding_amount, out] = sliding_signals_number(x,y, number_of_inerference_samples_y);
    end_padding = length(out) - sliding_amount;
    out = out(1:end_padding);
end