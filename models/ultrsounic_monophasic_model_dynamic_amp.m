function ultrsounic_monophasic_model_dynamic_amp(Tx_signal, Rx_signal, attenuated_percentage)
    
    subplot(3,2,1); plot(Tx_signal); title('Tx siganl'); xlabel('Time'); ylabel('Amplitude'); ylim([-2 2]);
    subplot(3,2,2); plot(Rx_signal, '-r'); title('Rx siganl'); xlabel('Time'); ylabel('Amplitude'); ylim([-2 2]);
    
    subplot(3,2, [3 4]); % 0.4 => 60%
    sliding_signals = sliding_signals_percentage(Tx_signal, Rx_signal,0.4);
    plot(sliding_signals);
    title(strcat('Monphasic Model - interference: 60% amplitude:' , num2str(attenuated_percentage))); ylim([-2 2]);
    
    subplot(3,2, [5 6]);
    correlation_signal = xcorr(sliding_signals, Tx_signal);
    plot(correlation_signal);
    title(strcat('Monphasic Model - interference: 60% amplitude:' , num2str(attenuated_percentage)));
    
end