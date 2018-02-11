classdef evaluator
    properties
        config
    end
    
    methods        
        function obj = evaluator(config)
            obj.config = config;
        end
        
        function value = getValue(obj, indiv)
            reals = indiv.getReals();
            value = obj.config.objectiveFunc(reals);
        end
        
        function fitness = getFitness(obj, indiv)
            fitness = obj.getValue(indiv);
            
            if obj.config.minimize
                fitness = - fitness;
            end
        end
        
        function fitness = getAllFitness(obj, pop)
            % TODO: Not recall this each time
            fitness = arrayfun(@(indiv) obj.getFitness(indiv), pop.getIndividuals());
        end
        
        function fitness = getBestFitness(obj, pop)
            allFitness = obj.getAllFitness(pop);
            fitness = max(allFitness);
        end
        
        function fitness = getMeanFitness(obj, pop)
            allFitness = obj.getAllFitness(pop);
            fitness = mean(allFitness);
        end
        
        function fitness = getStdDevFitness(obj, pop)
            allFitness = obj.getAllFitness(pop);
            fitness = std(allFitness);
        end
        
        function bestIndiv = getBestIndividual(obj, pop)
            bestIndiv = nan;
            bestFit = -inf;
            indivs = pop.getIndividuals();
            
            for i=1:length(indivs)
                curIndiv = indivs(i);
                curFit = obj.getFitness(curIndiv);
                
                if curFit > bestFit
                    bestFit = curFit;
                    bestIndiv = curIndiv;
                end
            end
        end
        
        function value = getBestValue(obj, pop)
            bestIndiv = obj.getBestIndividual(pop);
            value = obj.getValue(bestIndiv);
        end
    end
end

