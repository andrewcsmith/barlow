require 'prime'

class Barlow
  VERSION = "1.0.0"

  # Returns the harmonicity of a ratio (passed separate numerator and
  # denominator)
  def self.harmonicity num, den
    sign = self.indigestibility(num) > self.indigestibility(den) ? 1.0 : -1.0
    sign / (self.indigestibility(num) + self.indigestibility(den) - 2 * self.indigestibility(num.lcm(den)))
  end

  # Returns the indigestibility of an integer
  def self.indigestibility p
    factors = p.prime_division
    2.0 * factors.inject(0) {|memo, x| memo += ( x[1] * ( (x[0]-1)**2.0 ) / x[0] ) }
  end
  
  # Returns the first differential ratio, reduced
  def self.interior_ratio r1, r2
    ratio = [r1[1] * r2[0], r1[0] * r2[1]]
    gcd = ratio.first.gcd ratio.last
    ratio.collect! {|r| r / gcd}
  end

  # Returns the harmonicity between the two ratio
  def self.interior_harmonicity r1, r2
    self.harmonicity(*self.interior_ratio(r1, r2))
  end
end

