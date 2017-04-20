require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule26b do
        let :disambiguator_prefix_rule26b do
          DisambiguatorPrefixRule26b.new
        end

        let :words do
          %w[pemilih pemukul]
        end

        let :expected_words do
          %w[pilih pukul]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule26b.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
