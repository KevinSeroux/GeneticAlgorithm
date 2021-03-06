clear

config = config.negativeRosenbrock();
%config = config.griewank();
%config = config.compet();
pop = model.population.generate(config); % Initial pop
evaluator = evaluator(config);
algo = geneticAlgorithm(config, evaluator, pop);
algo.run();