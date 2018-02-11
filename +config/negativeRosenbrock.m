function myconfig = negativeRosenbrock()
    myconfig = model.config();   
    myconfig.chromosRepr = [
        model.chromosomeRepr(-30, 30, 53), ...
        model.chromosomeRepr(-30, 30, 53)
    ];
    myconfig.minimize = true;
    myconfig.objectiveFunc = @(args) config.objective.griewank(args);
    myconfig.crossoverFun = @(parents) crossover.multipoint(parents, 2);
    myconfig.display = {display.text()};
end

