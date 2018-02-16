function children = wholeArithmetic(parents)
    assert(size(parents, 1) == 2);
    
    children = crossover.utils.forEachChromosome(...
        @(parentsSameChromo) atomicCrossover(parentsSameChromo), ...
        parents ...
    );
end

function children = atomicCrossover(parents)
    chromoP1 = parents(1);
    chromoP2 = parents(2);
    chromoRepr = chromoP1.getRepr();
    p1 = chromoP1.getReal();
    p2 = chromoP2.getReal();
    
    a = rand();
    b = 1 - a;
    child1 = a*p1 + b*p2;
    child2 = b*p1 + a*p2;
    
    children = [ ...
        model.chromosome('real', child1, chromoRepr), ...
        model.chromosome('real', child2, chromoRepr)
    ];
end