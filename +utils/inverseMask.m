function inverse = inverseMask(mask)
    len = length(mask);
    inverse = repmat('1' + '0', 1, len) - mask;
    inverse = cast(inverse, 'char');
end

