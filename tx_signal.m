function [t_total signal] = tx_signal()
    f = 5000;
    t = 0:2e-5:1/f;
    phases = [0 pi 0 pi 0 0 0 0 0 0];
    
    
    x = [];
    for n = 1:10
        x = [x sin(2*pi*f*t+ phases(n))];
    end
    clc
    t_total = [0];
    for step = 2:length(x)
        t_total = [t_total t_total(end) + 2e-5];
    end
    signal = x;
end