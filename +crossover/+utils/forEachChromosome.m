function children = forEachChromosome(fun, parentsChromos)
    %ex: parents(1, :) = parent 1, all the chromosomes
    [countParents, countChromosomes] = size(parentsChromos);
    
    children(countParents, countChromosomes) = model.chromosome;
    for i=1:countChromosomes
        children(:,i) = fun(parentsChromos(:,i));
    end
end

