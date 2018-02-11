function binaryStr = binary(length)
    binaryStr = char(randi([0 1], 1, length) + '0');
end