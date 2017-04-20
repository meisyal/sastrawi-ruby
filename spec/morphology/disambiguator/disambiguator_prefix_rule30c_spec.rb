require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule30c do
        let :disambiguator_prefix_rule30c do
          DisambiguatorPrefixRule30c.new
        end

        let :words do
          %w[pengetahuan pengeblog pengetest]
        end

        let :expected_words do
          %w[tahuan blog test]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule30c.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
