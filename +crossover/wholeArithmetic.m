function child = wholeArithmetic(parents)
    p1Chromos = parents(1).getChromosomes();
    p2Chromos = parents(2).getChromosomes();
    N = length(p1Chromos);
    childChromos = [];
    
    for i=1:N
        p1CurChromo = p1Chromos(i);
        p2CurChromo = p2Chromos(i);
        
        childCurChromo = wholeArithmeticOnUniqueChromosome(p1CurChromo, p2CurChromo);
        childChromos = [childChromos, childCurChromo];
    end
    
    child = model.individual(childChromos);
end

function chromosome = wholeArithmeticOnUniqueChromosome(p1, p2)
    repr = p1.getRepr();
    p1 = p1.getReal();
    p2 = p2.getReal();
    
    a = rand();
    value = a*p1 + (1-a)*p2;
    
    chromosome = model.chromosome('real', value, repr);
end