require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule20 do
        let :disambiguator_prefix_rule20 do
          DisambiguatorPrefixRule20.new
        end

        let :words do
          %w[pewarna peyoga]
        end

        let :expected_words do
          %w[warna yoga]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule20.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
