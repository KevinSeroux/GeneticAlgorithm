function mutatedChromo = normal(chromosome)    
    repr = chromosome.getRepr();
    real = chromosome.getReal(); 
    
    interval = min(repr.max - real, real - repr.min);
    sigma = interval / 3; % 3-sigma to nearest boundary
    value = sigma * randn() + real;
        
    mutatedChromo = model.chromosome('real', value, repr());
end