function children = wholeArithmetic(parents)
    p1Chromos = parents(1).getChromosomes();
    p2Chromos = parents(2).getChromosomes();
    N = length(p1Chromos);
    childrenChromos(2, N) = model.chromosome;
    
    % Repeat for N chromosomes
    for i=1:N
        p1CurChromo = p1Chromos(i);
        p2CurChromo = p2Chromos(i);
        
        childrenCurChromo = wholeArithmeticOnUniqueChromosome(p1CurChromo, p2CurChromo);
        childrenChromos(:,i) = childrenCurChromo;
    end
    
    children = [ ...
        model.individual(childrenChromos(1,:)), ...
        model.individual(childrenChromos(2,:)) ...
    ];
end

function chromosome = wholeArithmeticOnUniqueChromosome(p1, p2)
    repr = p1.getRepr();
    p1 = p1.getReal();
    p2 = p2.getReal();
    
    a = rand();
    child1Value = a*p1 + (1-a)*p2;
    child2Value = (1-a)*p1 + a*p2;
    
    chromosome = [ ...
        model.chromosome('real', child1Value, repr), ...
        model.chromosome('real', child2Value, repr) ...
    ];
end