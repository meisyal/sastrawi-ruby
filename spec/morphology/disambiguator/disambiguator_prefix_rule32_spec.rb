require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule32 do
        let :disambiguator_prefix_rule32 do
          DisambiguatorPrefixRule32.new
        end

        let :words do
          %w[pelajar pelayan peledak pelirik pelobi pelupa]
        end

        let :expected_words do
          %w[ajar layan ledak lirik lobi lupa]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule32.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
