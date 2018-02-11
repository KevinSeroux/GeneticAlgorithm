classdef individual    
    properties(Access = private)
        chromosomes
    end
    
    methods
        function obj = individual(chromosomes)
            obj.chromosomes = chromosomes;
        end
        
        function chromosomes = getChromosomes(obj)
            chromosomes = obj.chromosomes;
        end
        
        function ret = iterateOverChromosomes(obj, fun)
            chromos = obj.getChromosomes();
            N = length(chromos);
            ret = [];
            
            for i=1:N
                ret = [ret, fun(chromos(i))];
            end
        end
        
        function bin = getBins(obj)
            bin = obj.iterateOverChromosomes(@(chromo) chromo.getBin());
        end
        
        function reals = getReals(obj)
            reals = obj.iterateOverChromosomes(@(chromo) chromo.getReal());
        end
        
        function print(obj, evaluator)
            reals = obj.getReals();
            reals = arrayfun(@(real) num2str(real), reals, 'UniformOutput', false);
            value = evaluator.getValue(obj);
            
            disp(['Input: ' reals ' Output: ' num2str(value)]);
        end
    end
end

