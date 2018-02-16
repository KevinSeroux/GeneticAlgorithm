function mutant = nonUniform(gen, indiv, config)
    chromos = indiv.getChromosomes();
    mutatedChromos = arrayfun(@(chromo) mutateChromosome(gen, chromo, config), chromos);
    
    mutant = model.individual(mutatedChromos);
end

function mutatedChromo = mutateChromosome(gen, chromosome, config)    
    repr = chromosome.getRepr();
    
    real = chromosome.getReal();    
    draw = rand();
    temp = @(val) temperature(gen, config.maxGen, config.temperatureBFactor, val);
    
    if draw >= 0.5
        value = real + temp(repr.max - real);
    else
        value = real - temp(real - repr.min);
    end
        
    mutatedChromo = model.chromosome('real', value, repr());
end

function temp = temperature(g, gmax, b, real)
    assert(g <= gmax);
    
    temp = real * (1 - rand()^((1-(g/gmax))^b));
end
