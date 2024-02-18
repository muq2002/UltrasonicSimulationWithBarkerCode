clear; close all; clc;
freq = 1e3;
for interference_percentage = 1:-0.1:0
    figure(fix(10*interference_percentage)+20);
    ultrsounic_monphasic_model(interference_percentage);
end