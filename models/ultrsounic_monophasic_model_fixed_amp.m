function ultrsounic_monophasic_model(t, Tx_signal, Rx_signal, percentage)
    subplot(3,2,1); plot(t, Tx_signal); title('Tx siganl'); xlabel('Time'); ylabel('Amplitude'); ylim([-2 2]);
    subplot(3,2,2); plot(t, Rx_signal, '-r'); title('Rx siganl'); xlabel('Time'); ylabel('Amplitude'); ylim([-2 2]);
    
    subplot(3,2, [3 4]);
    sliding_signals = sliding_signals_percentage(Rx_signal, Rx_signal,percentage);
    plot(sliding_signals);
    title(strcat('Monphasic Model: Sliding Result at %' , num2str((percentage * 100) - 100 ))); ylim([-2 2]);
    
    subplot(3,2, [5 6]);
    correlation_signal = xcorr(sliding_signals, Tx_signal);
    plot(correlation_signal);
    title(strcat('Monphasic Model: Correlation Result at %' , num2str((percentage * 100) - 100 )));
    
end