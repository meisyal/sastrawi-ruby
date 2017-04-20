require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule21b do
        let :disambiguator_prefix_rule21b do
          DisambiguatorPrefixRule21b.new
        end

        let :words do
          %w[perusak perancang]
        end

        let :expected_words do
          %w[rusak rancang]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule21b.disambiguate(word)).to eq(expected_words[i])
          end
        end

        it 'should be null' do
          expect(disambiguator_prefix_rule21b.disambiguate('perjudikan')).to eq(nil)
        end
      end
    end
  end
end
