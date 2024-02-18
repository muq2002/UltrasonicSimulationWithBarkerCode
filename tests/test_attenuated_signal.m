% Define the signal parameters
clear; close all; clc;
f = 1e3; % Frequency in Hz
window_size = 2000; % Window size

% Generate the sine wave signal
t = linspace(0,1/f, 2*f);
x = sin(2*pi*f*t);

% Generate the Hamming window
hamming_window = hamming_window(window_size);

% Attenuate the sine wave signal using the Hamming window
y = x;
x = x .* hamming_window;

% Plot the signal
figure;
subplot(2,2,[1 2]); plot(hamming_window);
subplot(2,2,3); plot(t, x); ylim([-2 2]);
subplot(2,2,4); plot(t, y); ylim([-2 2]);


