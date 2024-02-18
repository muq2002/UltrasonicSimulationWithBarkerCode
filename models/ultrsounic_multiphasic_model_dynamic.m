function ultrsounic_multiphasic_model_dynamic(Tx_signal,Rx_signal, interference_percentage)
    
    subplot(3,2,1); plot(Tx_signal); title('Tx siganl'); xlabel('Time'); ylabel('Amplitude'); ylim([-2 2]);
    subplot(3,2,2); plot(Rx_signal, '-r'); title('Rx siganl'); xlabel('Time'); ylabel('Amplitude'); ylim([-2 2]);
    
    subplot(3,2, [3 4]);
    sliding_signals = sliding_signals_percentage(Rx_signal, Rx_signal,interference_percentage);
    plot(sliding_signals);
    title(strcat('Multiphasic Model: Rx window %' , num2str((interference_percentage * 100) - 100 ))); ylim([-2 2]);


    subplot(3,2, [5 6]);
    correlation_signal = xcorr(sliding_signals, Tx_signal);
    plot(correlation_signal);
    title(strcat('Multiphasic Model: Correlation Result at %' , num2str((interference_percentage * 100) - 100 )));
end