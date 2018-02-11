classdef config
    %PARAMS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        chromosRepr
        minimize = false
        objectiveFunc       
        popSize = 10
        probMutation = 0.1
        parentsCount = 2
        display = {display.graph(), display.text()};
        selectionFun = @(pop, eval) selection.tournament(pop, eval);
        crossoverFun = @(parents) crossover.uniform(parents);
        mutationFun = @(child, probMuta) mutation.uniform(child, probMuta);
        replacementFun = @(parent, offspring, eval) replacement.steadyState(parent, offspring, eval);
    end
end

