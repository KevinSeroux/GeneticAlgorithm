classdef chromosomeRepr
    %CHROMOSOMEREPR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        min
        max
        bitLength
        truncate
    end
    
    methods
        function obj = chromosomeRepr(min, max, bitLength, truncate)
            assert(min <= max);
            assert(bitLength > 0);
            
            if nargin <= 3; truncate = false; end
            
            obj.min = min;
            obj.max = max;
            obj.bitLength = bitLength;
            obj.truncate = truncate;
        end
    end
end

