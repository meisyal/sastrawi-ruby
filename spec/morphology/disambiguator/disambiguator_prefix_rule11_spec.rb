require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule11 do
        let :disambiguator_prefix_rule11 do
          DisambiguatorPrefixRule11.new
        end

        let :words do
          %w[membantu memfasilitasi memvonis]
        end

        let :expected_words do
          %w[bantu fasilitasi vonis]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule11.disambiguate(word)).to eq(expected_words[i])
          end
        end

        it 'should be null' do
          expect(disambiguator_prefix_rule11.disambiguate('mewarnai')).to be_nil
        end
      end
    end
  end
end
