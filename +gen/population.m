function pop = population(popSize, chromosomesRepr)
    pop = [];
    for i = 1:popSize
        pop = [pop, gen.individual(chromosomesRepr)];
    end
end

