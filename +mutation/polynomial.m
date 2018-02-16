function mutatedChromo = polynomial(chromosome, config)    
    repr = chromosome.getRepr();
    real = chromosome.getReal(); 
    n = config.polynomialNFactor;
    
    u = rand();
    if u < 0.5
        xi = (2*u)^(1/(n+1))-1;
    else
        xi = 1-(2*(1-u))^(1/(n+1));
    end
        
    dmax = min(repr.max - real, real - repr.min);
    value = real + dmax * xi;
        
    mutatedChromo = model.chromosome('real', value, repr);
end