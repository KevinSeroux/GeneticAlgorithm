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
            bit = binMutatedChromo(j);
            
            % Flip bit
            if bit == '0'
                binMutatedChromo(j) = '1';
            else
                binMutatedChromo(j) = '0';
            end
        end
    end
    
    mutatedChromo = model.chromosome('bin', binMutatedChromo, chromosome.getRepr());
end

