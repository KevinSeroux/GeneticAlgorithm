function children = uniform(parents)
    p1Chromos = parents(1).getChromosomes();
    p2Chromos = parents(2).getChromosomes();
    N = length(p1Chromos);
    childrenChromos(2, N) = model.chromosome;
    
    % Repeat for N chromosomes
    for i=1:N
        p1CurChromo = p1Chromos(i);
        p2CurChromo = p2Chromos(i);
        
        childrenCurChromo = uniformOnUniqueChromosome(p1CurChromo, p2CurChromo);
        childrenChromos(:,i) = childrenCurChromo;
    end
    
    children = [ ...
        model.individual(childrenChromos(1,:)), ...
        model.individual(childrenChromos(2,:)) ...
    ];
end

function chromo = uniformOnUniqueChromosome(p1, p2)
    len = length(p1);
    repr = p1.getRepr();
    
    mask = gen.binary(len);
    binChromo = utils.applyMask(p1.getBin(), p2.getBin(), mask);
    chromo = model.chromosome('bin', binChromo, repr);
end