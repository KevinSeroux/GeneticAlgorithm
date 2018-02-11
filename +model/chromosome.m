classdef chromosome
    %CHROMOSOME Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = private)
        repr
        value
    end
    
    methods        
        function obj = chromosome(type, value, repr)
            % type: 'bin' or 'real'
            % type: value in binary or real format
            % repr
            
            assert(strcmp(type, 'bin') || strcmp(type, 'real'));
            
            obj.repr = repr;
            
            if strcmp(type, 'bin')
                obj = obj.setBin(value);
            elseif strcmp(type, 'real')
                obj = obj.setReal(value);
            else
                assert(true);
            end
        end
        
        function real = getReal(obj)
            real = utils.bin2Real(obj.value, obj.repr);
        end
        
        function bin = getBin(obj)
            bin = obj.value;
        end
        
        function repr = getRepr(obj)
            repr = obj.repr;
        end
        
        function obj = setReal(obj, yReal)
            obj.value = utils.real2Bin(yReal, obj.repr);
        end
        
        function obj = setBin(obj, bin)
            obj.value = bin;
        end
    end
end

