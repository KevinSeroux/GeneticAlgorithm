function mutatedChromo = boundary(chromosome)
    repr = chromosome.getRepr();
    draw = rand();

    if draw <= 0.5
        value = repr.min;
    else
        value = repr.max;
    end
    
    mutatedChromo = model.chromosome('real', value, repr);
end

