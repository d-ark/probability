require 'spec_helper'

module Probability
  describe Probability do

    it 'creates probability' do
      expect(Probability.new 0.78).to be
    end

    it 'understands equality' do
      expect(Probability.new 0.78).to eq(Probability.new 0.78)
      expect(Probability.new 0.78).not_to eq(Probability.new 0.13)
      expect(Probability.new 0.78).not_to eq(nil)
      expect(Probability.new 0.78).not_to eq(Object.new)
    end

    it 'does not allow to create probabilities with incorrect values' do
      expect { Probability.new 1.13 }.to raise_error ArgumentError, 'probability value is out of range [0..1]'
      expect { Probability.new -0.1 }.to raise_error ArgumentError, 'probability value is out of range [0..1]'
      expect { Probability.new 178989987645465 }.to raise_error ArgumentError, 'probability value is out of range [0..1]'
      expect { Probability.new 0 }.not_to raise_error
      expect { Probability.new 1 }.not_to raise_error
    end

    it 'compares probabilities' do
      expect(Probability.new(0.78)).to be > Probability.new(0.13)
      expect(Probability.new(0.13)).to be <= Probability.new(0.78)
      expect { Probability.new(0.78) > nil }.to raise_error ArgumentError
    end

    describe '#not' do
      it 'returns probability of event not happening' do
        expect(Probability.new(0.78).not).to eq(Probability.new 0.22)
      end
    end

    describe '#and' do
      it 'returns probability of both of two events happening' do
        probability1 = Probability.new(0.13)
        probability2 = Probability.new(0.06)
        expect(probability1.and probability2).to eq(Probability.new 0.0078)
      end
    end

    describe '#or' do
      it 'returns probability of any of two events happening' do
        probability1 = Probability.new(0.13)
        probability2 = Probability.new(0.06)
        expect(probability1.or probability2).to eq(Probability.new 0.1822)
      end
    end
  end
end
