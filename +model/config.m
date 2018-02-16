classdef config
    %PARAMS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        chromosRepr
        minimize
        objectiveFunc       
        popSize
        parentsCount
        matingPoolSize
        probMutation
        maxGen
        temperatureBFactor
        polynomialNFactor
        display
        selectionFun
        crossoverFun
        mutationFun
        replacementFun
    end
    
    methods
        function obj = config()
            obj.minimize = false;
            obj.popSize = 10;
            obj.parentsCount = 2;
            obj.matingPoolSize = obj.popSize / obj.parentsCount;
            obj.probMutation = 0.1;
            obj.maxGen = 100;
            obj.temperatureBFactor = 1.5;
            obj.polynomialNFactor = 2;
            obj.display = {display.graph(), display.text()};
            % Functions always last
            obj.selectionFun = @(pop, eval, count) selection.tournament(pop, eval, count);
            obj.crossoverFun = @(parents) crossover.uniform(parents);
            obj.mutationFun = @(gen, chromo) mutation.polynomial(chromo, obj);
            obj.replacementFun = @(parent, offspring, eval) replacement.steadyState(parent, offspring, eval);
        end
    end
end

