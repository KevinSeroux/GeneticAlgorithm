function matingPool = stochasticUniversalSampling(pop, eval, N)
    individuals = pop.getIndividuals();
    countIndividuals = length(individuals);
    matingPool(N) = model.individual;

    wheel = cumulatedProbabilities(pop, eval);
    separationDegrees = (2*pi)/N;
    
    pos = rand();
    cursor = pos;
    
    for i=1:N        
        % Iterate until the cursor skipped the individual
        j = 1;
        while cursor > wheel(2, j)
            j = 1 + mod(j, countIndividuals);
        end
        
        % Get the skipped individual
        %if j == 1; j = countIndividuals; end
        indivIdx = wheel(1, j);
        matingPool(i) = individuals(indivIdx);
        
        cursor = mod(cursor + separationDegrees, 1);
    end
end

function wheel = cumulatedProbabilities(pop, eval)
    individuals = pop.getIndividuals();
    countIndividuals = length(individuals);
    wheel(2, countIndividuals) = nan;
    p(countIndividuals) = nan;
    fitnesses(countIndividuals) = -inf;
    sumFitness = 0;
    
    for k=1:countIndividuals
        curFitness = eval.getFitness(individuals(k));
        fitnesses(k) = curFitness;
        sumFitness = sumFitness + curFitness;
    end
    
    for k=1:countIndividuals
        curFitness = fitnesses(k);
        p(k) = curFitness / sumFitness;
    end
    
    [sortedProbas, indices] = sort(p);
    cumulatedProbas = cumsum(sortedProbas);
    wheel(1,:) = indices;
    wheel(2,:) = cumulatedProbas;
end