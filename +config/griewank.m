function myconfig = griewank()
    myconfig = model.config();   
    myconfig.chromosRepr = [
        model.chromosomeRepr(-30, 30, 53), ...
        model.chromosomeRepr(-30, 30, 53)
    ];
    myconfig.minimize = true;
    myconfig.popSize = 30;
    myconfig.matingPoolSize = 15;
    myconfig.probMutation = 0.2;
    myconfig.objectiveFunc = @(args) config.objective.griewank(args);
    myconfig.crossoverFun = @(parents) crossover.uniform(parents);
end

