function myconfig = compet()
    myconfig = model.config();
    myconfig.chromosRepr = [
        model.chromosomeRepr(0, 2, 53, true), ...
        model.chromosomeRepr(0, 3, 53, true)
    ];
    myconfig.maxGen = 200;
    myconfig.probMutation = 0.1;
    myconfig.popSize = 20;
    myconfig.matingPoolSize = myconfig.popSize / myconfig.parentsCount;
    myconfig.temperatureBFactor = 1.5;
    %myconfig.display = {display.text()};
    myconfig.objectiveFunc = @(args) config.objective.negativeRosenbrock(args);
    myconfig.crossoverFun = @(parents) crossover.simulatedBinary(parents);
    myconfig.mutationFun = @(gen, child) mutation.nonUniform(gen, child, myconfig);
end