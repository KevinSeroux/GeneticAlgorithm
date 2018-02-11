function chromosome = padding(strippedChromosome, requiredLength)
    padding = repmat('0', 1, requiredLength - length(strippedChromosome));
    chromosome = strcat(padding, strippedChromosome);
end