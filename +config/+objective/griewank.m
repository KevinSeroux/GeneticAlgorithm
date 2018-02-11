function out = griewank(args)
    assert(length(args) == 2);
    
    x = args(1);
    y = args(2);
    
    assert(-30 <= x && x <= 30)
    assert(-30 <= y && y <= 30)
    
    out = (x^2 + y^2)/4000 - cos(x)*cos(y/sqrt(2)) + 1;
end

