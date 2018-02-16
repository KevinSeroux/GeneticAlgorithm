function myconfig = negativeRosenbrock()
    myconfig = model.config();
    myconfig.chromosRepr = [
        model.chromosomeRepr(0, 2, 53, true), ...
        model.chromosomeRepr(0, 3, 53, true)
    ];
    %myconfig.display = {display.text()};
    myconfig.probMutation = 0.5; % Because we have only 2 real genes
    myconfig.selectionFun = @(pop, eval) selection.stochasticUniversalSampling(pop, eval, myconfig.matingPoolSize);
    myconfig.objectiveFunc = @(args) config.objective.negativeRosenbrock(args);
    myconfig.crossoverFun = @(parents) crossover.simulatedBinary(parents);
    myconfig.mutationFun = @(gen, chromo) mutation.uniform(chromo);
end