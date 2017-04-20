require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule10 do
        let :disambiguator_prefix_rule10 do
          DisambiguatorPrefixRule10.new
        end

        let :words do
          %w[melalui meracuni mewarnai meyakini]
        end

        let :expected_words do
          %w[lalui racuni warnai yakini]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule10.disambiguate(word)).to eq(expected_words[i])
          end
        end

        it 'should be null' do
          expect(disambiguator_prefix_rule10.disambiguate('menyayangi')).to eq(nil)
        end
      end
    end
  end
end
