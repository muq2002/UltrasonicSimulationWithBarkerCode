clear; clc;

f1 = 1000;
t1 = linspace(0, 10/f1, 4*f1);

x = sin(2*pi*f1*t1);
y = cos(2*pi*f1*t1);


z = sliding_signals_percentage(x,y, 0.4);
% generate time for sliding signals
t2 = [0];
for n = 2:length(z)
   t2 = [t2 t2(end) + 2.5006e-06];  
end

figure(1);
subplot(3,1, 1); plot(t1, x); % Period 1e-2
subplot(3,1, 2); plot(t1, y); % Period 1e-2
subplot(3,1, 3); plot(t2, z); % Period 15e-3

