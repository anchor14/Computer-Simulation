if ((nc > 0) && (sum(onroad) > 0))
    set(hcars, 'xdata', x(find(onroad)), 'ydata', y(find(onroad)));
    pause(0.01);
end