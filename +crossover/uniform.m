function chromos = uniform(parents)
    assert(length(parents) == 2);

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
    
    chromos = [ ...
        model.chromosome('bin', child1, repr), ...
        model.chromosome('bin', child2, repr) ...
    ];
end