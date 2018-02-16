function children = multipoint(parents, k)
    assert(size(parents, 1) == 2);
    
    children = crossover.utils.forEachChromosome(...
        @(parentsSameChromo) atomicCrossover(parentsSameChromo, k), ...
        parents ...
    );
end

function children = atomicCrossover(parents, k)
    assert(length(parents) == 2);
    
    p1 = parents(1);
    p2 = parents(2);
    repr = p1.getRepr();
    p1 = p1.getBin();
    p2 = p2.getBin();
    len = length(p1);
    
    points = [sort(randperm(len, k)), len];
    
    mask = repmat('1', 1, len);
    i = 1;
    while i < length(points)
        from = points(i);
        to = points(i + 1);
        mask(from:to) = '0';
        i = i + 2;
    end
    inverseMask = utils.inverseMask(mask);
    
    child1 = utils.applyMask(p1, p2, mask);
    child2 = utils.applyMask(p1, p2, inverseMask);
    
    children = [ ...
        model.chromosome('bin', child1, repr), ...
        model.chromosome('bin', child2, repr) ...
    ];
end