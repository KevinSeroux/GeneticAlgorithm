function mutatedChromo = uniform(chromosome)
    repr = chromosome.getRepr();
    
    value = repr.min + repr.max * rand();
    
    mutatedChromo = model.chromosome('real', value, repr);
end

