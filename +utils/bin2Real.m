function real = bin2Real(bin, chromosomeRepr)
    min = chromosomeRepr.min;
    max = chromosomeRepr.max;
    bitLength = chromosomeRepr.bitLength;
    
    real = (bin2dec(bin) / (2^bitLength - 1)) * (max - min) + min;
end