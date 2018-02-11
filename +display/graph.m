classdef graph < display.base
    properties
        x = [];
        bestValues = [];
        meanFitnesses = [];
        stddevFitnesses = [];
    end
    
    methods        
        function obj = update(obj, generation, evaluator, newPopGen)
            curBest = evaluator.getBestValue(newPopGen);
            curMean = evaluator.getMeanFitness(newPopGen);
            curStdDev = evaluator.getStdDevFitness(newPopGen);
            
            obj.x = [obj.x, generation];
            obj.bestValues = [obj.bestValues, curBest];
            obj.meanFitnesses = [obj.meanFitnesses, curMean];
            obj.stddevFitnesses = [obj.stddevFitnesses, curStdDev];
            
            obj.draw();
        end
        
        function draw(obj)
            title('Measurements')
            xlabel('Generation')

            yyaxis left
            plot(obj.x, obj.bestValues)
            ylabel('Objective Value')

            yyaxis right
            plot(obj.x, obj.meanFitnesses, obj.x, obj.stddevFitnesses);
            ylabel('Mean/StdDev Fitness')

            legend('Best', 'Mean', 'StdDev')
            drawnow
        end
    end
end

