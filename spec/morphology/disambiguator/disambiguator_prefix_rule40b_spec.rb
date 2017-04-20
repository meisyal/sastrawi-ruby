require 'spec_helper'

module Sastrawi
  module Morphology
    module Disambiguator
      describe DisambiguatorPrefixRule40b do
        let :disambiguator_prefix_rule40b do
          DisambiguatorPrefixRule40b.new
        end

        let :words do
          %w[kinerja sinambung tinambah]
        end

        let :expected_words do
          %w[kerja sambung tambah]
        end

        it 'should disambiguate' do
          words.each_with_index do |word,i|
            expect(disambiguator_prefix_rule40b.disambiguate(word)).to eq(expected_words[i])
          end
        end
      end
    end
  end
end
