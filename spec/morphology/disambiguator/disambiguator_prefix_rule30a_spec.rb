require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule30a do
        let :disambiguator_prefix_rule30a do
          DisambiguatorPrefixRule30a.new
        end

        let :words do
          %w[pengalihan pengeram pengikat pengobat pengurusan]
        end

        let :expected_words do
          %w[alihan eram ikat obat urusan]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule30a.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
