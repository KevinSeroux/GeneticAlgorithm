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
                children = obj.crossover(parents);

                for j=1:length(children)
                    children(j) = obj.config.mutationFun(children(j), obj.config.probMutation);
                end

                offspring = [offspring, children];
            end
        end
        
        function children = crossover(obj, parents)
            countParents = length(parents);
            countChromos = length(obj.config.chromosRepr);
            % A row = an individual with several chromosomes as columns
            parentsChromos(countParents, countChromos) = model.chromosome;
            for i=1:countParents
                parentsChromos(i,:) = parents(i).getChromosomes();
            end
            
            % Iterate over the chromosomes (columns in parentsChromos)
            childrenChromos = [];
            for i=1:countChromos
                parentsCurChromo = parentsChromos(:,i);
                crossoveredChromos = obj.config.crossoverFun(parentsCurChromo);
                childrenChromos = [childrenChromos, crossoveredChromos]; %#ok<AGROW>
            end
            
            countChildren = length(childrenChromos) / countChromos;
            childrenChromos = reshape(childrenChromos, [countChildren, countChromos]);
            children(countChildren) = model.individual;
            
            % For each child
            for i=1:countChildren
                children(i) = model.individual(childrenChromos(i,:));
            end
        end
    end
end
