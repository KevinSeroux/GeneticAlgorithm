classdef graph < display.base
    properties
        x = [];
        bestValues = [];
        %worstValues = [];
        meanFitnesses = [];
        stddevFitnesses = [];
    end
    
    methods        
        function obj = update(obj, generation, evaluator, newPopGen)
            curBest = evaluator.getBestValue(newPopGen);
            %curWorst = evaluator.getWorstValue(newPopGen);
            curMean = evaluator.getMeanFitness(newPopGen);
            curStdDev = evaluator.getStdDevFitness(newPopGen);
            
            obj.x = [obj.x, generation];
            obj.bestValues = [obj.bestValues, curBest];
            %obj.worstValues = [obj.worstValues, curWorst];
            obj.meanFitnesses = [obj.meanFitnesses, curMean];
            obj.stddevFitnesses = [obj.stddevFitnesses, curStdDev];
            
            obj.draw();
        end
        
        function draw(obj)
            title('Measurements')
            xlabel('Generation')

            yyaxis left
            plot(obj.x, obj.bestValues);
            %plot(obj.x, obj.bestValues, obj.x, obj.worstValues);
            ylabel('Objective Value')

            yyaxis right
            plot(obj.x, obj.meanFitnesses, obj.x, obj.stddevFitnesses);
            ylabel('Mean/StdDev Fitness')

            legend('Best', 'Mean', 'StdDev')
            %legend('Best', 'Worst', 'Mean', 'StdDev')
            drawnow
        end
    end
end

