require "probability/version"

module Probability

  class Probability
    include Comparable

    PRECISION = 1e-12

    def initialize value
      @value = value
      validate
    end

    def == other
      return false unless other.is_a? Probability
      (other.value - value).abs < PRECISION
    end

    def <=> other
      raise ArgumentError.new("#{other} is not a probability") unless other.is_a? Probability
      value <=> other.value
    end

    def not
      self.class.new 1 - value
    end

    def and other
      self.class.new value * other.value
    end

    def or other
      self.not.and(other.not).not
    end

    protected

    attr_reader :value

    private

    def validate
      if @value < 0 || @value > 1
        raise ArgumentError.new('probability value is out of range [0..1]')
      end
    end

  end

end
