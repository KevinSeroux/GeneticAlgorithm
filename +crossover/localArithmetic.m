function children = localArithmetic(parents)
    assert(size(parents, 1) == 2);

    countChromosomes = size(parents, 2);
    children(2, countChromosomes) = model.chromosome;
    p(2, countChromosomes) = nan;
    c(2, countChromosomes) = nan;
    
    repr = arrayfun(@(c) c.getRepr(), parents(1,:));
    p(1,:) = arrayfun(@(c) c.getReal(), parents(1,:));
    p(2,:) = arrayfun(@(c) c.getReal(), parents(2,:));
    
    a = rand([1, countChromosomes]);
    b = ones(1, countChromosomes) - a;
    c(1,:) = a.*p(1,:) + b.*p(2,:);
    c(2,:) = b.*p(1,:) + a.*p(2,:);
    
    for i=1:2
        for j=1:countChromosomes
            children(i,j) = model.chromosome('real', c(i, j), repr(j));
        end
    end
end