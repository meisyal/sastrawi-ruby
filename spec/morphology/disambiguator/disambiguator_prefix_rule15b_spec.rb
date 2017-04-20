require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule15b do
        let :disambiguator_prefix_rule15b do
          DisambiguatorPrefixRule15b.new
        end

        let :words do
          %w[menulis menari]
        end

        let :expected_words do
          %w[tulis tari]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule15b.disambiguate(word)).to eq(expected_words[i])
          end
        end

        it 'should be null' do
          expect(disambiguator_prefix_rule15b.disambiguate('menyayangi')).to eq(nil)
        end
      end
    end
  end
end
