function matingpool = tournament(pop, eval, count)
    % CONSTANTS
    k = 2;
    
    individuals = pop.getIndividuals();
    N = length(individuals);
    matingpool = [];
    
    permutations = zeros(k, count);
    for j=1:k
        permutations(j,:) = randperm(N, count);
    end
    
    for i=1:count
        pool = permutations(:,i);
        pool = arrayfun(@(idx) individuals(idx), pool);
        indiv = selectBestIndiv(pool, eval);
        
        matingpool = [matingpool, indiv];
    end
end

function bestIndiv = selectBestIndiv(pool, eval)    
    k = length(pool);    
    bestIndiv = nan;
    bestFitness = -inf;

    for j=1:k
        curIndiv = pool(j);
        curFitness = eval.getFitness(curIndiv);

        if curFitness > bestFitness
            bestFitness = curFitness;
            bestIndiv = curIndiv;
        end
    end
end