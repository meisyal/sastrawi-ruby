require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule31b do
        let :disambiguator_prefix_rule31b do
          DisambiguatorPrefixRule31b.new
        end

        let :words do
          %w[penyalut penyekat penyikat penyukat]
        end

        let :expected_words do
          %w[salut sekat sikat sukat]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule31b.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
