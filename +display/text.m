classdef text < display.base
    properties
        bestIndiv
    end
    
    methods        
        function obj = update(obj, generation, evaluator, newPopGen)
            curBestIndiv = evaluator.getBestIndividual(newPopGen);
            
            if ~isequal(curBestIndiv, obj.bestIndiv)
                obj.bestIndiv = curBestIndiv;
                disp(["Generation: " generation]);
                obj.bestIndiv.print(evaluator);
            end
        end
    end
end

