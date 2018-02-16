function myconfig = negativeRosenbrock()
    myconfig = model.config();
    myconfig.chromosRepr = [
        model.chromosomeRepr(0, 2, 53, true), ...
        model.chromosomeRepr(0, 3, 53, true)
    ];
    %myconfig.display = {display.text()};
    myconfig.objectiveFunc = @(args) config.objective.negativeRosenbrock(args);
    myconfig.crossoverFun = @(parents) crossover.simulatedBinary(parents);
    myconfig.mutationFun = @(gen, child) mutation.polynomial(child, myconfig);
end