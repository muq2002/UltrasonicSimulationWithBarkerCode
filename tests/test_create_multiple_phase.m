clear; close all; clc

signal = create_multiple_phase_signal(1e3, 10);
figure(1);
plot(signal); ylim([-2 2]);