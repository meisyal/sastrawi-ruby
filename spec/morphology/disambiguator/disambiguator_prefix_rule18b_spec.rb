require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule18b do
        let :disambiguator_prefix_rule18b do
          DisambiguatorPrefixRule18b.new
        end

        let :words do
          %w[menyapu menyikat]
        end

        let :expected_words do
          %w[sapu sikat]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule18b.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
