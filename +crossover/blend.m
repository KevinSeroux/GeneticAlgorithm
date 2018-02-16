function children = blend(parents)
    assert(size(parents, 1) == 2);
    
    children = crossover.utils.forEachChromosome(...
        @(parentsSameChromo) atomicCrossover(parentsSameChromo), ...
        parents ...
    );
end

function children = atomicCrossover(parents)
    % CONSTANTS
    a = 0.5;
    
    chromoRepr = parents(1).getRepr();
    p1 = parents(1).getReal();
    p2 = parents(2).getReal();
    
    % We suppose x1 <= x2
    x1 = min(p1, p2);
    x2 = max(p1, p2);
    
    interval = a*(x2 - x1);
    lowerBound = x1 - interval;
    upperBound = x2 + interval;
    assert(lowerBound <= upperBound);
    
    c = lowerBound + (upperBound - lowerBound) * rand();
    
    children = model.chromosome('real', c, chromoRepr);
end