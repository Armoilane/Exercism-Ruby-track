module Hamming

  def self.compute(strand1, strand2)
    raise ArgumentError unless strand1.length == strand2.length

    nucleotide_pairs(strand1, strand2).count { |pair| different?(pair) }
  end

  private

  def self.different?(pair)
    pair.first != pair.last
  end

  def self.nucleotide_pairs(strand1, strand2)
    strand1.chars.zip(strand2.chars)
  end

end
