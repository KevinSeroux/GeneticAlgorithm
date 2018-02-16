function children = uniform(parents)
    assert(size(parents, 1) == 2);
    
    children = crossover.utils.forEachChromosome(...
        @(parentsSameChromo) atomicCrossover(parentsSameChromo), ...
        parents ...
    );
end

function children = atomicCrossover(parents)
    p1 = parents(1);
    p2 = parents(2);
    repr = p1.getRepr();
    p1 = p1.getBin();
    p2 = p2.getBin();
    len = length(p1);
    
    mask = gen.binary(len);
    inverseMask = utils.inverseMask(mask);
    child1 = utils.applyMask(p1, p2, mask);
    child2 = utils.applyMask(p1, p2, inverseMask);
    
    children = [ ...
        model.chromosome('bin', child1, repr), ...
        model.chromosome('bin', child2, repr) ...
    ];
end