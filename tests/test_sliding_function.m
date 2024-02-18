%% Testing to for sliding function
clear ; close all; clc;

x = 1:1:5;
y = 5:-1:1;

start_point = 3;
out = sliding_signals_number(x,y, start_point)
test = sliding_signals_percentage(x,y, 0.4)