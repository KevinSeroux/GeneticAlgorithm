function myconfig = griewank()
    myconfig = model.config();
    myconfig.popSize = 100;
    myconfig.chromosRepr = [
        model.chromosomeRepr(0, 2, 53), ...
        model.chromosomeRepr(0, 3, 53)
    ];
    myconfig.objectiveFunc = @(args) config.objective.negativeRosenbrock(args);
end