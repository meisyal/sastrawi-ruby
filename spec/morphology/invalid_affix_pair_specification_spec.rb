require 'spec_helper'

require 'sastrawi/morphology/invalid_affix_pair_specification'

module Sastrawi
  module Morphology
    describe InvalidAffixPairSpecification do
      let :invalid_affix_pair_specification do
        InvalidAffixPairSpecification.new
      end

      let :non_invalid_affix_pair_words do
        %w[memberikan ketahui]
      end

      let :invalid_affix_pair_words do
        %w[berjatuhi dipukulan ketiduri ketidurkan menduaan terduaan perkataan]
      end

      it 'should be false' do
        non_invalid_affix_pair_words.each do |word|
          expect(invalid_affix_pair_specification.satisfied_by?(word)).to eq(false)
        end
      end

      it 'should be true' do
        invalid_affix_pair_words.each do |word|
          expect(invalid_affix_pair_specification.satisfied_by?(word)).to eq(true)
        end
      end
    end
  end
end
