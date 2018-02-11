function out = negativeRosenbrock(args)
    assert(length(args) == 2);
    
    x = args(1);
    y = args(2);
    
    assert(0 <= x && x <= 2)
    assert(0 <= y && y <= 3)
    
    out = -((1-x^2) + 100*(y-x^2)^2);
end

