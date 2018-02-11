function indiv = individual(chromosomesRepr)
    chromosomes = arrayfun(@(repr) gen.chromosome(repr), chromosomesRepr);
    indiv = model.individual(chromosomes);
end