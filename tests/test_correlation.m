clear; close all; clc;

f = 1e3;
t = linspace(0, 1/f, 2*f);

x = sin(2*pi*f*t);
y = sin(2*pi*f*t + pi);

r = [x y];

correlation = xcorr(r,x);

figure;
subplot(1,2, 1); plot(x);
subplot(1,2, 2); plot(correlation);
