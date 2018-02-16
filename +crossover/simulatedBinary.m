function children = simulatedBinary(parents)
    assert(size(parents, 1) == 2);
    
    children = crossover.utils.forEachChromosome(...
        @(parentsSameChromo) atomicCrossover(parentsSameChromo), ...
        parents ...
    );
end

function children = atomicCrossover(parents)
    % CONSTANTS
    n = 2;
    
    chromoRepr = parents(1).getRepr();
    p1 = parents(1).getReal();
    p2 = parents(2).getReal();
    
    b = nan;
    u = rand();
    
    if u <= 0.5
        b = (2*u)^(1/(n+1));
    else
        b = (2*(1-u))^(-1*(1/(n+1)));
    end
    
    c1 = 0.5 * ((p1 + p2) + b * (p1 - p2));
    c2 = 0.5 * ((p2 + p1) + b * (p2 - p1));
    
    children = [ ...
        model.chromosome('real', c1, chromoRepr), ...
        model.chromosome('real', c2, chromoRepr)
    ];
end