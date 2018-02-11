function chromo = chromosome(chromosomeRepr)
    binaryStr = gen.binary(chromosomeRepr.bitLength);
    chromo = model.chromosome('bin', binaryStr, chromosomeRepr);
end