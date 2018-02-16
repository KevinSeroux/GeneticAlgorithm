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
            while obj.generation < obj.config.maxGen
                obj = obj.iteration();
            end
            
            pop = obj.pop;
        end
        
        function obj = iteration(obj)
            obj.generation = obj.generation + 1;
            
            matingPool = obj.config.selectionFun(obj.pop, obj.eval);
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
                children = obj.mutation(children);

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
            
            childrenChromos = obj.config.crossoverFun(parentsChromos);
            countChildren = size(childrenChromos, 1);
            
            % Build children individuals
            children(countChildren) = model.individual;
            for i=1:countChildren
                children(i) = model.individual(childrenChromos(i,:));
            end
        end
        
        function mutatedChildren = mutation(obj, children)
            countChildren = length(children);
            countChromosomes = length(obj.config.chromosRepr);
            mutatedChildren(countChildren) = model.individual;
            
            for i=1:countChildren
                chromos = children(i).getChromosomes();
                
                for j=1:countChromosomes
                    draw = rand();
                    
                    % Probability of mutation for each gene
                    if draw <= obj.config.probMutation
                        chromos(j) = obj.config.mutationFun(obj.generation, chromos(j));
                    end
                end
                
                mutatedChildren(i) = model.individual(chromos);
            end
        end
    end
end
