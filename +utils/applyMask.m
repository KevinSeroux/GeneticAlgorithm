function chromosome = applyMask(p1, p2, mask)
    mask = mask - '0';
    reverseMask = ones(1, length(mask));
    reverseMask = reverseMask - mask;
    
    chromosome = p1.*mask + p2.*reverseMask;
    chromosome = cast(chromosome, 'char');
end