require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule21a do
        let :disambiguator_prefix_rule21a do
          DisambiguatorPrefixRule21a.new
        end

        let :words do
          %w[peradilan perundikan]
        end

        let :expected_words do
          %w[adilan undikan]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule21a.disambiguate(word)).to eq(expected_words[i])
          end
        end

        it 'should be null' do
          expect(disambiguator_prefix_rule21a.disambiguate('perjudikan')).to be_nil
        end
      end
    end
  end
end
