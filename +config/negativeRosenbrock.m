function myconfig = negativeRosenbrock()
    myconfig = model.config();   
    myconfig.chromosRepr = [
        model.chromosomeRepr(-30, 30, 53), ...
        model.chromosomeRepr(-30, 30, 53)
    ];
    myconfig.minimize = true;
    myconfig.objectiveFunc = @(args) config.objective.griewank(args);
    myconfig.crossoverFun = @(parents) crossover.wholeArithmetic(parents);
    % Reduce count of children because whole arithmetic provide 2 children for 2 parents
    myconfig.matingPoolSize = 5;
    %myconfig.display = {display.text()};
end

