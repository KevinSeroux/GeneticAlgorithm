function child = uniform(parents)
    p1Chromos = parents(1).getChromosomes();
    p2Chromos = parents(2).getChromosomes();
    N = length(p1Chromos);
    childChromos = [];
    
    for i=1:N
        p1CurChromo = p1Chromos(i);
        p2CurChromo = p2Chromos(i);
        
        childCurChromo = uniformOnUniqueChromosome(p1CurChromo, p2CurChromo);
        childChromos = [childChromos, childCurChromo];
    end
    
    child = model.individual(childChromos);
end

function chromo = uniformOnUniqueChromosome(p1, p2)
    len = length(p1);
    repr = p1.getRepr();
    
    mask = gen.binary(len);
    binChromo = utils.applyMask(p1.getBin(), p2.getBin(), mask);
    chromo = model.chromosome('bin', binChromo, repr);
end