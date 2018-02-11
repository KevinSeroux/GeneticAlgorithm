classdef chromosomeRepr
    %CHROMOSOMEREPR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        min
        max
        bitLength
    end
    
    methods
        function obj = chromosomeRepr(min, max, bitLength)
            obj.min = min;
            obj.max = max;
            obj.bitLength = bitLength;
        end
    end
end

