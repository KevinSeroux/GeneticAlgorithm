function bin = real2Bin(real, chromosomeRepr)
    min = chromosomeRepr.min;
    max = chromosomeRepr.max;
    bitLength = chromosomeRepr.bitLength;
    
    bin = dec2bin(((2^bitLength - 1)*(real - min))/(max - min));
end