function pop = steadyState(initialPop, offspring, eval)
    indivs = initialPop.getIndividuals();
    N = length(offspring) / 2;
    
    killPoolIdx = selection.killTournament(initialPop, N, eval);
    
    for i=1:N
        idx = killPoolIdx(i);
        indivs(idx) = offspring(i);
    end
    
    pop = model.population(indivs);
end

