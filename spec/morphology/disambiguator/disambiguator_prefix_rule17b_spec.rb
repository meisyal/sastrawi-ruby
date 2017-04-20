require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule17b do
        let :disambiguator_prefix_rule17b do
          DisambiguatorPrefixRule17b.new
        end

        let :words do
          %w[mengira mengecil]
        end

        let :expected_words do
          %w[kira kecil]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule17b.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
