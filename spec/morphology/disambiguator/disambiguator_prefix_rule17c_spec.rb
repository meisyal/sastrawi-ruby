require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule17c do
        let :disambiguator_prefix_rule17c do
          DisambiguatorPrefixRule17c.new
        end

        let :words do
          %w[mengecas mengecat]
        end

        let :expected_words do
          %w[cas cat]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule17c.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
