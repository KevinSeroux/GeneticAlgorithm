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
            
            % Allow preallocating array of chromosomes
            if nargin == 0; return; end
            
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
        
        function obj = setReal(obj, real)  
            if real < obj.repr.min || real > obj.repr.max
                real = obj.handleOverflow(real);
            end
            
            obj.value = utils.real2Bin(real, obj.repr);
        end
        
        function value = handleOverflow(obj, real)            
            if obj.repr.truncate
                value = obj.truncat(real);
            else
                value = obj.reduce(real);
            end
        end
        
        function value = truncat(obj, real)
            if real < obj.repr.min
                value = obj.repr.min;
            elseif real > obj.repr.max
                value = obj.repr.max;
            end
        end
        
        function value = reduce(obj, real)
            if real < obj.repr.min
                value = 2 * obj.repr.min - real;
            elseif real > obj.repr.max
                value = 2 * obj.repr.max - real;
            end
        end
        
        function obj = setBin(obj, bin)
            assert(length(bin) == obj.repr.bitLength);
            
            obj.value = bin;
        end
    end
end

