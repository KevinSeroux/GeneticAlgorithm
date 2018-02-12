classdef geneticAlgorithm
    properties
        config
        eval
        pop
        generation = 0
    end
    
    methods
        function obj = geneticAlgorithm(config, eval, pop)
            obj.config = config;
            obj.eval = eval;
            obj.pop = pop;
        end
        
        function pop = run(obj)
            while 1
                obj = obj.iteration();
            end
            
            pop = obj.pop;
        end
        
        function obj = iteration(obj)
            obj.generation = obj.generation + 1;
            
            matingPool = obj.config.selectionFun(obj.pop, obj.eval, obj.config.matingPoolSize);
            offspring = obj.crossoverAndMutation(matingPool);
            obj.pop = obj.config.replacementFun(obj.pop, offspring, obj.eval);
            
            % Notify
            display = obj.config.display;
            for i=1:length(display)
                newDisplayState = display{i}.update(obj.generation, obj.eval, obj.pop);
                obj.config.display{i} = newDisplayState;
            end
        end

        function offspring = crossoverAndMutation(obj, matingPool)
            N = length(matingPool);
            offspring = [];
            for i=1:N
                % 2 random parents
                parentsIdx = randperm(N, obj.config.parentsCount);
                parents = arrayfun(@(idx) matingPool(idx), parentsIdx);

                % crossover can give birth of 2 children
                children = obj.config.crossoverFun(parents);

                for j=1:length(children)
                    children(j) = obj.config.mutationFun(children(j), obj.config.probMutation);
                end

                offspring = [offspring, children];
            end
        end
    end
end
