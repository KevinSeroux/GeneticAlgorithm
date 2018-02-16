classdef population    
    properties (Access = private)
        pop
    end
    
    methods (Static)
        function pop = generate(config)
            pop = gen.population(config.popSize, config.chromosRepr);
            pop = model.population(pop);
        end
    end
    
    methods        
        function obj = population(pop)
            obj.pop = pop;
        end
        
        function pop = getIndividuals(obj)
            pop = obj.pop;
        end
        
        function obj = addIndividual(obj, indiv)
            obj.pop = [obj.pop, indiv];
        end
        
        function value = count(obj)
            value = length(obj.pop);
        end
    end
end

