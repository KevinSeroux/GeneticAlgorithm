function child = multipoint(parents, k)  
    p1Chromos = parents(1).getChromosomes();
    p2Chromos = parents(2).getChromosomes();
    N = length(p1Chromos);
    childChromos = [];
    
    for i=1:N
        p1CurChromo = p1Chromos(i);
        p2CurChromo = p2Chromos(i);
        
        childCurChromo = multipointOnUniqueChromosome(p1CurChromo, p2CurChromo, k);
        childChromos = [childChromos, childCurChromo];
    end
    
    child = model.individual(childChromos);
end

function chromosome = multipointOnUniqueChromosome(p1, p2, k)
    repr = p1.getRepr();
    p1 = p1.getBin();
    p2 = p2.getBin();
    
    len = length(p1);
    points = [0, sort(randperm(len, k)), len];
    mask = [];
    
    for i=2:length(points)
        bit = mod(i-1, 2) + '0';
        repeat = points(i) - points(i - 1);
        mask = [mask, repmat(bit, 1, repeat)];
    end
    
    binChromosome = utils.applyMask(p1, p2, mask);
    chromosome = model.chromosome('bin', binChromosome, repr);
end