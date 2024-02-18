function t = generate_time(x)
    t_total = [0];
    for step = 2:length(x)
        t_total = [t_total t_total(end) + 2e-5];
    end
    
    t = t_total;
end