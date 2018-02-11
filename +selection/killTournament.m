function killPoolIdx = killTournament(pop, N, eval)
    % CONSTANTS
    k = 2;
    
    popCount = length(pop.getIndividuals());    
    killPoolIdx = [];
    
    while length(killPoolIdx) < N
        pool = randperm(popCount, k);
        indivIdx = selectWorstIndiv(pop, pool, eval);
        
        killPoolIdx = unique([killPoolIdx, indivIdx]);
    end
end

function worstIndivIdx = selectWorstIndiv(pop, pool, eval)    
    k = length(pool);
    individuals = pop.getIndividuals();
    
    worstIndivIdx = nan;
    worstFitness = inf;

    for j=1:k
        curIndivIdx = pool(j);
        curFitness = eval.getFitness(individuals(curIndivIdx));

        if curFitness < worstFitness
            worstFitness = curFitness;
            worstIndivIdx = curIndivIdx;
        end
    end
end