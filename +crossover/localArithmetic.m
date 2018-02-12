function children = localArithmetic(parents)
    chromosP1 = parents(1).getChromosomes();
    chromoRepr1 = chromosP1(1).getRepr();
    chromoRepr2 = chromosP1(2).getRepr();
    p1 = parents(1).getReals();
    p2 = parents(2).getReals();
    
    a = rand(1, 2);
    b = [1 1] - a;
    child1 = a.*p1 + b.*p2;
    child2 = b.*p1 + a.*p2;
    
    chromosChild1 = [ ...
        model.chromosome('real', child1(1), chromoRepr1), ...
        model.chromosome('real', child1(2), chromoRepr2)
    ];
    
    chromosChild2 = [ ...
        model.chromosome('real', child2(1), chromoRepr1), ...
        model.chromosome('real', child2(2), chromoRepr2)
    ];
    
    children = [ ...
        model.individual(chromosChild1), ...
        model.individual(chromosChild2) ...
    ];
end