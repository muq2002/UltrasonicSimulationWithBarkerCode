 function ultrsounic_multiphasic_model_dynamic_amp(Tx_signal, Rx_signal, attenuated_percentage)

    subplot(3,2,1); plot(Tx_signal); title('0.9 Of Tx siganl '); xlabel('Time'); ylabel('Amplitude'); ylim([-2 2]);
    subplot(3,2,2); plot(Rx_signal, '-r'); title(strcat(num2str(0.9 * attenuated_percentage) , ' Rx siganl'));
    xlabel('Time'); ylabel('Amplitude'); ylim([-2 2]);
    
    subplot(3,2, [3 4]); % 0.4 => 60% from the signal
    sliding_signals = sliding_signals_percentage(Tx_signal, Rx_signal, 0.4);
    plot(sliding_signals);
    title(strcat('Multiphasic Model - interference: 60% amplitude:' , num2str(attenuated_percentage))); ylim([-2 2]);

    subplot(3,2, [5 6]);
    correlation_signal = xcorr(sliding_signals, Tx_signal);
    correlation_signal = correlation_signal(4000:end);
    plot(correlation_signal);
    title(strcat('Multiphasic Model - interference: 60% amplitude:' , num2str(attenuated_percentage)));

    [px py]= ginput(1);
    right_half = round(px)+ 400; left_half = 0; %left_half = round(px) - 400;
    segment = sliding_signals(left_half:right_half);
    
    segment_max = max(segment)
    segment_mean = mean(segment)
    
    title({strcat('Max: ', num2str(segment_max)) strcat('Mean: ', num2str(segment_mean)) });
    

end