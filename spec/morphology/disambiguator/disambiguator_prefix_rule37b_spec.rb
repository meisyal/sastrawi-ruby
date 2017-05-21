require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule37b do
        let :disambiguator_prefix_rule37b do
          DisambiguatorPrefixRule37b.new
        end

        let :words do
          %w[gerigi serabut]
        end

        let :expected_words do
          %w[gigi sabut]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule37b.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
