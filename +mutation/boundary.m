function mutant = uniform(indiv, probMutation)
    chromos = indiv.getChromosomes();
    mutatedChromos = arrayfun(@(chromo) mutateChromosome(chromo, probMutation), chromos);
    
    mutant = model.individual(mutatedChromos);
end

function mutatedChromo = mutateChromosome(chromosome, probMutation)
    binMutatedChromo = chromosome.getBin();
    
    for j=1:length(binMutatedChromo)
        draw = rand();
        if draw < probMutation
            draw = rand();
            
            if draw <= 0.5
                binMutatedChromo(j) = '0';
            else
                binMutatedChromo(j) = '1';
            end
        end
    end
    
    mutatedChromo = model.chromosome('bin', binMutatedChromo, chromosome.getRepr());
end

