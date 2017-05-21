require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule25 do
        let :disambiguator_prefix_rule25 do
          DisambiguatorPrefixRule25.new
        end

        let :words do
          %w[pembaruan pemfokusan pemvaksinan]
        end

        let :expected_words do
          %w[baruan fokusan vaksinan]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule25.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
